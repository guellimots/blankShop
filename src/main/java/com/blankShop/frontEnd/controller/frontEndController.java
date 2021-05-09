package com.blankShop.frontEnd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.blankShop.frontEnd.model.OrderDTO;
import com.blankShop.frontEnd.model.dateComparator;
import com.blankShop.frontEnd.model.priceComparator;
import com.blankShop.frontEnd.service.MemberService;
import com.blankShop.frontEnd.service.OrderService;
import com.blankShop.frontEnd.service.ProductService;
import com.blankShop.frontEnd.service.advertisingService;
import com.blankShop.model.Member;
import com.blankShop.model.Product;
import com.blankShop.model.advertising;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

@Controller
@SessionAttributes({ "alertmsg","result" })
@RequestMapping("/frontEnd")
public class frontEndController {
	@Autowired
	MemberService memberService;

	@Autowired
	OrderService orderService;

	@Autowired
	advertisingService adService;

	@Autowired
	ProductService pdService;
	
	@GetMapping("/test")
	public String test() {
		
		return "productList";
		
	}

	public synchronized boolean isCaptchaValid(String secretKey, String token) {
		try {
			String url = "https://www.google.com/recaptcha/api/siteverify",
					params = "secret=" + secretKey + "&response=" + token;

			HttpURLConnection http = (HttpURLConnection) new URL(url).openConnection();
			http.setDoOutput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			OutputStream out = http.getOutputStream();
			out.write(params.getBytes("UTF-8"));
			out.flush();
			out.close();

			InputStream res = http.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(res, "UTF-8"));

			StringBuilder sb = new StringBuilder();
			int cp;
			while ((cp = rd.read()) != -1) {
				sb.append((char) cp);
			}
			JSONObject json = new JSONObject(sb.toString());
			res.close();

			return json.getBoolean("success");
		} catch (Exception e) {
		}
		return false;
	}

	@PostMapping("/checkLogin")
	public String checkLogin(@RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password,
			@RequestParam(name = "rememberMe", required = false) String rememberMe,
			@RequestParam(name = "recaptchaToken") String recaptchaToken, Model m, HttpSession session,
			HttpServletResponse response) {

		boolean checkAccount = memberService.checkMemberbyEmail(email);
		boolean checkRecaptcha = isCaptchaValid("6LciCrYaAAAAADxh4H2fA2AZceu-P2RNGSqXPeHM", recaptchaToken);
		Map<String, String> accrountErr = new HashMap<String, String>();
		Map<String, String> recaptchaErr = new HashMap<String, String>();

		if ((checkAccount) && (checkRecaptcha)) {
			Member member = memberService.getMemberbyEmail(email);

			if (rememberMe != null) {
				Cookie c = new Cookie("password", password);
				c.setMaxAge(24 * 60 * 60 * 30);
				response.addCookie(c);
			}

			session.setAttribute("email", email);
			session.setAttribute("memberId", member.getMemberId());
			session.setAttribute("name", member.getMemberName());

			if (member.getProfileImg() != null) {
				byte[] base64 = Base64Utils.encode(member.getProfileImg());
				String strbase64 = new String(base64);
				session.setAttribute("proImgSrc", "data:image/png;base64," + strbase64);
			} else {
				session.setAttribute("proImgSrc", "/blankShop/assets/img/no-image.png");
			}

			return "redirect:/frontEnd/welcomePage";
		}

		if (checkAccount == false) {
			accrountErr.put("msg", "帳號密碼輸入錯誤，請重新輸入");
		}

		if (checkRecaptcha == false) {
			recaptchaErr.put("msg", "未通過reCAPTCHA驗證");
		}

		m.addAttribute("accrountErr", accrountErr);
		m.addAttribute("recaptchaErr", recaptchaErr);

		return "login";
	}

	@GetMapping("/logOut")
	public String logout(SessionStatus status, HttpServletRequest request) {
		status.setComplete();
		HttpSession session = request.getSession(false);
		session.invalidate();
		return "redirect:/frontEnd/indexPage";
	}

	@PostMapping("/googleLoginController")
	@ResponseBody
	public String googleLogin(@RequestParam(name = "idtoken") String idtoken, HttpSession session)
			throws GeneralSecurityException, IOException {

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new JacksonFactory())
				.setAudience(Collections
						.singletonList("528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com"))
				.build();

		GoogleIdToken idToken = verifier.verify(idtoken);
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			String userId = payload.getSubject();
			// System.out.println("User ID: " + userId);

			String email = payload.getEmail();
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");

			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("proImgSrc", pictureUrl);

			// save the member Info if the email does not exist in the database
			if (memberService.checkMemberbyEmail(email) == false) {
				Member member = new Member();
				member.setMemberName(name);
				member.setEmail(email);
				member.setGoogleImgUrl(pictureUrl);
				memberService.save(member);
			}

			Member memberNew = memberService.getMemberbyEmail(email);
			session.setAttribute("memberId", memberNew.getMemberId());

			return "success";
		}

		return "fail";
	}

	@GetMapping("/adImg/{index}")
	@ResponseBody
	public ResponseEntity<byte[]> getAdImg(@PathVariable Integer index) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		List<advertising> adList = adService.findNewAds();
		ArrayList<advertising> adArrayList = new ArrayList<advertising>(adList);
		byte[] adImg = adArrayList.get(index - 1).getImg();
		return new ResponseEntity<byte[]>(adImg, headers, HttpStatus.OK);

	}

	@GetMapping("/products/setIndex/{index}")
	public String setProductDisplayIndex(@PathVariable Integer index, Model m) {
		m.addAttribute("displayIndex", index);
		return "productList";
	}
	
	public ArrayList<Product> selectDistinctProduct(List<Product> duplicateList){
		ArrayList<Product> result=new ArrayList<Product>();
		ArrayList<Integer> indexList=new ArrayList<Integer>();
		
		for (Product item: duplicateList) {
			if (indexList.indexOf(item.getProductID())==-1) {
				indexList.add(item.getProductID());
				result.add(item);
			}
		}
		
		return result;
	}
	@GetMapping("/products/getIndex/{index}")
	@ResponseBody
	public ArrayList<Product> getProductDisplayIndex(@PathVariable Integer index, Model m) {
		
		ArrayList<Product> result=new ArrayList<Product>(); 

		switch (index) {

		    case 1:
		    List<Product> items1=pdService.allProducts();
		    result=new ArrayList<Product>(this.selectDistinctProduct(items1));
			break;
			
		    case 2:
		    List<Product> items2=pdService.itemsOfGenre("上衣");
			result=new ArrayList<Product>(this.selectDistinctProduct(items2));
		    break;
		    
		    case 3:
		    List<Product> items3=pdService.itemsOfGenre("襯衫");
			result=new ArrayList<Product>(this.selectDistinctProduct(items3));
			break;
			
		    case 4:
			List<Product> items4=pdService.itemsOfGenre("褲裝");
			result=new ArrayList<Product>(this.selectDistinctProduct(items4));
			break;
			    
		    case 5:
			List<Product> items5=pdService.itemsOfGenre("裙裝");
			result=new ArrayList<Product>(this.selectDistinctProduct(items5));
			break;
			    
		    case 6:
			List<Product> items6=pdService.newProducts("2021-04-01", "2021-05-14");
			result=new ArrayList<Product>(this.selectDistinctProduct(items6));
			break;
			    
		    case 7:
			List<Product> items7=pdService.onSaleItems();
			result=new ArrayList<Product>(this.selectDistinctProduct(items7));
			break;
		}
		
	 m.addAttribute("result", result);
		
		return result;	
	}
	@PostMapping("/products/searchAll")
	@ResponseBody
	public ArrayList<Product> searchAll(@RequestParam("keyword") String keyword, Model m) {
		
		keyword="%"+keyword+"%";
		
		ArrayList<Product> result=new ArrayList<Product>();
		List<Product> duplicateResult=pdService.itemsOfKeyword(keyword);
		result=new ArrayList<Product>(this.selectDistinctProduct(duplicateResult));
		m.addAttribute("result", result);
		return result;	
	}
	@GetMapping("/products/orderByDate")
	@ResponseBody
	public ArrayList<Product> orderByDate(@ModelAttribute("result") ArrayList<Product> result){
		Collections.sort(result, new dateComparator());		
		return result;		
	}
	@GetMapping("/products/orderByPrice")
	@ResponseBody
	public ArrayList<Product> orderByPrice(@ModelAttribute("result") ArrayList<Product> result){  
	   Collections.sort(result, new priceComparator());
	   return result;
	}
	@GetMapping("/product/{productID}")
	public String loadProductPage(@PathVariable Integer productID, Model m) {
		List<Product> products=pdService.findByProductID(productID);
		ArrayList<String> colorList=new ArrayList<String>();
		ArrayList<String> imgList=new ArrayList<String>();
		
		for (Product item:products) {
			if(colorList.indexOf(item.getColorCode())==-1) {
				colorList.add(item.getColorCode());
			}
		}
		
		for (Product item:products) {
			imgList.add(item.getProductImgDir1());
			imgList.add(item.getProductImgDir2());
			imgList.add(item.getProductImgDir3());
		}
		
		Product product=products.get(0);
		if (product.getSalePrice()==0) {
			product.setSalePrice(product.getProductPrice());
			product.setProductPrice(null);
		}
		
		m.addAttribute("imgList",imgList);
		m.addAttribute("product",product);
		m.addAttribute("colorList",colorList);
		return "product";
	}
	@PostMapping("/product/checkStock")
	public @ResponseBody HashMap<String, String> checkStock(@RequestBody HashMap<String, String> cartRequest){
		
		HashMap<String, String> stockMsg=new HashMap<String, String>();
		Integer productID=Integer.parseInt(cartRequest.get("productID"));
		String colorCode=cartRequest.get("colorCode");
		String size=cartRequest.get("size");
		Integer quantity=Integer.parseInt(cartRequest.get("quantity"));
		Product product=pdService.findByProductIDAndColorCodeAndSize(productID, colorCode, size);
		if (product.getStockNumber()<quantity) {
			stockMsg.put("msg", "fail");
			stockMsg.put("stockNumber", Integer.toString(product.getStockNumber()));
		}
		else {
			stockMsg.put("msg", "success");
		}
		
		return stockMsg;
	}
	@PostMapping("/product/placeInCart")
	public @ResponseBody HashMap<String, String> placeInCart(@RequestBody HashMap<String, String> cartRequest, HttpSession session){
		
		HashMap<String, String> cartInfo=new HashMap<String, String>();
		
		Integer productID=Integer.parseInt(cartRequest.get("productID"));
		String colorCode=cartRequest.get("colorCode");
		String size=cartRequest.get("size");
		
		Product product=pdService.findByProductIDAndColorCodeAndSize(productID, colorCode, size);
		
		if (product.getSalePrice()==0) {
			product.setSalePrice(product.getProductPrice());

		}
		
		Integer memberId=(Integer) session.getAttribute("memberId");
		String email=(String) session.getAttribute("email");
		
		cartInfo.put("memberId", memberId.toString());
		cartInfo.put("email", email);
		cartInfo.put("color", cartRequest.get("colorCode"));
		cartInfo.put("size", cartRequest.get("size"));
		cartInfo.put("amount", cartRequest.get("quantity"));
		cartInfo.put("price", product.getSalePrice().toString());
		cartInfo.put("productImg", product.getProductImgDir1());
		cartInfo.put("productName", product.getProductName());
		cartInfo.put("typeId", product.getTypeId().toString());
		
		return cartInfo;
	}
	@GetMapping("/orders")
	public @ResponseBody List<OrderDTO> getOrderByOrderId(Model model, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		List<OrderDTO> list = orderService.getOrdersbyMemberId(memberId);
		return list;
	}

	@PostMapping("/register")
	public String insertMember(@RequestParam(name = "user-name") String memberName,
			@RequestParam(name = "user-email") String email, @RequestParam(name = "user-password") String password,
			Member mb, Model model) {
		System.out.println(email);
		// System.out.println(memberService.checkMemberbyEmail(email));
		// 判斷email是否有註冊過
		if (memberService.checkMemberbyEmail(email)) {
			String result = "good";
			model.addAttribute("alertmsg", result);
//			Map<String, String> errormsg = new HashMap<String, String>();
//			errormsg.put("msg", "此信箱已經註冊過、請重新輸入");
//			model.addAttribute("errormsg", errormsg);
			return "register";
		} else {
			mb.setMemberName(memberName);
			mb.setEmail(email);
			mb.setPassword(password);
			memberService.save(mb);
			return "index";
		}
	}

	// 跳轉到會員頁面
	@GetMapping(value = "/showmem")
	public String showMember(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("memberId");
		Member mb = memberService.getMemberbyId(id);
		model.addAttribute(mb);
	
		return "my-account";
	}

	// 載入會員資訊
	@ModelAttribute
	public void getMember(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("memberId");
		System.out.println("@ModelAttribute.getMember()...");

		if (id != null) {
			Member member = memberService.getMemberbyId(id);
			model.addAttribute("Member", member);

			model.addAttribute("id", id);
			if (member.getProfileImg() != null) {
				byte[] base64 = Base64Utils.encode(member.getProfileImg());
				String strbase64 = new String(base64);
				model.addAttribute("strbase64", "data:image/png;base64," + strbase64);
			}
		}
	}

	// 修改會員資料
	@PostMapping(value = "/editMember")
	public String editMember(@RequestParam Integer id, @RequestParam String memberName, @RequestParam String cellNumber,
			@RequestParam Date birthday, @RequestParam String address, @RequestParam String email,
			@RequestParam("fileupload") MultipartFile multipartFile, Model m) throws IOException {

		String result = "";
		
		Member member = memberService.getMemberbyEmail(email);
		byte[] picture = multipartFile.getBytes();
		if (picture.length == 0) {
			result = "good";
		} else {
			member.setProfileImg(multipartFile.getBytes());
			result = "good";
		}
		if (memberName.equals("") == false) {
			result = "good";
			member.setMemberName(memberName);
		}
		if (birthday.equals("") == false) {
			result = "good";
			member.setBirthday(birthday);
		}
		if (cellNumber.equals("") == false) {
			result = "good";
			member.setCellNumber(cellNumber);
		}
		if (address.equals("") == false) {
			result = "good";
			member.setAddress(address);
		}
		member.setEmail(email);

		memberService.update(member);
		
		m.addAttribute("alertmsg", result);
		m.addAttribute("Member", member);
		return "redirect:/frontEnd/showmem";
	}

	// 單獨修改密碼功能
	@PostMapping("/editpassword")
	public String editpassword(@RequestParam Integer id, @RequestParam(name = "new-pwd") String password,
			@RequestParam(name = "confirm-pwd") String passwordforcheck, HttpSession session) {

		Member member = memberService.getMemberbyId(id);

		if (password.equals(passwordforcheck)) {

			member.setPassword(password);
			memberService.save(member);
			System.out.println("一樣");
		} else {
			System.out.println("密碼不一樣");
		}
		return "redirect:/frontEnd/showmem";
	}

}