package com.blankShop.backEnd.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blankShop.model.Department;
import com.blankShop.model.Employee;
import com.blankShop.backEnd.service.DepartmentService;
import com.blankShop.backEnd.service.employeeService;




@Controller
@RequestMapping("/emp")
public class EmployeeController {
	
	String noImage = "classpath:static/img/backEnd/NoImage.jpg";
//	String noImageFemale = "/img/backEnd/NoImage.jpg";
//	String noImageMale = "/img/backEnd/NoImage.jpg";
	String imageRootDirectory = "C:\\_SpringBoot\\Employees";
	File imageFolder = null; 
	
	
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	//去找有沒有images這個資料夾,沒有就建一個,File類似檔案總管的工作
	public EmployeeController() {
		imageFolder = new File(imageRootDirectory, "images");
		if ( !imageFolder.exists() )
			imageFolder.mkdirs();
	}
	
	@Autowired
    private ResourceLoader resourceLoader;
	@Autowired
	employeeService employeeService;
	
	@Autowired
	DepartmentService departmentService;
	
	
	@Autowired
	ServletContext context;
	
	
	@GetMapping("/transEmp")
	public String transEmp() {
		return "empinfo";	
		
	}
	//登入者的empId
	public Integer Login_ID;
	//登入者的姓名
	public String Login_name;
	
	public String Login_mail;
	
	
	@GetMapping(value = "/loginID/{empid}")
	@ResponseBody
	public Employee loginID(@PathVariable Integer empid) {
		Employee empl=employeeService.get(empid);
		this.Login_ID=empid;
		this.Login_name=empl.getEmpName();
		this.Login_mail=empl.getEmail();
		return empl;
	}
	
	
	
	
	@GetMapping("/newemp")
	public String emp() {
		return "newEmp";
	}
	
	//檢查身分證是否重複@GetMapping("/checkID")
	@GetMapping("/checkID/{personID}")
	@ResponseBody
	public  Map<String, String> checkID(@PathVariable String personID){
		Map<String, String> msg = new HashMap<>();
		Boolean status=employeeService.findByPersonID(personID);
		if (status)
			msg.put("msg", "此身分證可使用");
		else
			msg.put("msg", "此身分證已被註冊");
		return msg;
		}
	
	//檢查mail是否重複@GetMapping("/checkMail")
	@GetMapping("/checkMail/{email}")
	@ResponseBody
	public  Map<String, String> checkMail(@PathVariable String email){
		Map<String, String> msg = new HashMap<>();
		Employee emp=employeeService.findemployee(email);
		if (emp==null)
			msg.put("msg", "此email可使用");
		else
			msg.put("msg", "此email已註冊過");
		return msg;
		}
		

	//增加一筆新員工
	@PostMapping(value = "/newemp")
	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	public String add(
			@RequestParam(value = "empName") String empName, @RequestParam(value = "email") String email, @RequestParam(value = "password") String password,
			@RequestParam(value = "personID") String personID, @RequestParam(value = "mobile") String mobile,@RequestParam(value = "address") String address,
			@RequestParam(value = "birthday") String birthday,@RequestParam(value = "hireDate") String hireDate,
			@RequestParam(value = "empStatus") String empStatus,@RequestParam(value = "rankTitle") String rankTitle,
			@RequestParam(value = "deptNo") Department deptNo, @RequestParam(value ="fileUpload") MultipartFile image, Model model) {
		Employee employee=new Employee();
		employee.setEmpName(empName);
		employee.setPassword(password);
		employee.setPersonID(personID);
		employee.setMobile(mobile);
		employee.setAddress(address);
		employee.setEmpStatus(empStatus);
		employee.setRankTitle(rankTitle);
		employee.setDeptNo(deptNo);
		employee.setBirthday(birthday);
		employee.setHireDate(hireDate);
		employee.setEmail(email);
		
			
		byte[] originalImgByte=null;
		if (image.isEmpty()) {
						
			BufferedImage bufferedImage;
			ByteArrayOutputStream baos = new ByteArrayOutputStream();

			try {
				
				Resource resource = resourceLoader.getResource(noImage); 	
				File file = resource.getFile();
				
				
				bufferedImage = ImageIO.read(file);
				ImageIO.write(bufferedImage, "jpg", baos);
				baos.flush();
				originalImgByte = baos.toByteArray();
				baos.close();
				employee.setEmpimg(originalImgByte);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		
		}
		else {
			try {
			employee.setEmpimg(image.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}}
		
			
		Timestamp adminTime = new Timestamp(System.currentTimeMillis());

		employee.setCreateDate(adminTime);
		employee.setCreateUser(Login_name);
		employee.setModifDate(adminTime);
		employee.setModifUser(Login_name);
		employeeService.save(employee);
		
		Employee emp=employeeService.findemployee(email);
		
		model.addAttribute(emp);
		
		Employee employee02=employeeService.get(employee.getEmpId());
		
		model.addAttribute("emp",employee02);
		
		//想辦法做一個彈出視窗寫 更新成功 按"確認" 關閉
		return "redirect:/emp/editEmp?msg=success";

}
	
	//員工登入後自助更新自己資料
	@GetMapping("/updatePersonal")
	public String modiPersonal(Model model,String msg) {
	    Employee employee=employeeService.findemployee(Login_mail);
		model.addAttribute("strbase64", "image/avatar.png");
		if (employee.getEmpimg() != null) {
			byte[] base64 = Base64Utils.encode(employee.getEmpimg());
			String strbase64 = new String(base64);
			
			model.addAttribute("strbase64", "data:image/png;base64," + strbase64);
		}
		System.out.println(msg);
		model.addAttribute("msg",msg);
		model.addAttribute(employee);
		
		return "updatePersonal";
	}
	
	@PostMapping("/updatePersonal")
	public String modiPersonal(@ModelAttribute("employee") Employee employee,BindingResult result, Model model) {
		
		Employee employee01=employeeService.findemployee(employee.getEmail());

			
			try {
				if(!employee.getImage().isEmpty()) {
					employee01.setEmpimg(employee.getImage().getBytes());
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "redirect:/emp/updatePersonal?msg=update failed";
			}
			
			if(!employee.getAddress().isEmpty()) {
				employee01.setAddress(employee.getAddress());
			}
			if(!employee.getMobile().isEmpty()) {
				employee01.setMobile(employee.getMobile());
			}
					
			Timestamp adminTime = new Timestamp(System.currentTimeMillis());
			employee01.setModifDate(adminTime);
			employee01.setModifUser(employee.getEmpName());
		
			employeeService.update(employee01);
			//再做一次查詢再回傳確認有寫入成功
			Employee employee02=employeeService.get(employee01.getEmpId());
			
			model.addAttribute("emp",employee02);
			
			//想辦法做一個彈出視窗寫 更新成功 按"確認" 關閉
			return "redirect:/emp/updatePersonal?msg=success";
		}
		
	
	// 顯示所有員工資料
	@GetMapping("/showAllEmployees")
	@ResponseBody
	public List<Employee> list(Model model) { 
		List<Employee> employees=employeeService.getAllEmployee();	 
		return employees;
	}
	
			

	@GetMapping("/editEmp")
	public String editEmp(String msg,Model m) {
		m.addAttribute("msg",msg);
		return "editEmp";
	}
	
	
	//模糊查詢  
	@GetMapping(value = "/like")
    @ResponseBody
    public List<Employee> showSearch(@RequestParam(value = "name") String empName ,
                             Model model){
        logger.info("name:" + empName);
        List<Employee> list = employeeService.searchEmps(empName);
        logger.info("查询结果数:" + list.size());
        return list;
    }
	
	@GetMapping(value = "/updateEmp/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("strbase64", "image/avatar.png");
		Employee employee = employeeService.get(id);
		if (employee.getEmpimg() != null) {
			byte[] base64 = Base64Utils.encode(employee.getEmpimg());
			String strbase64 = new String(base64);
			model.addAttribute("strbase64", "data:image/png;base64," + strbase64);
		}
		model.addAttribute(employee);
		return "updateEmployee";
	}
	
	
	
	@PostMapping("/updateEmp/{id}")
		public String modify(
				@ModelAttribute("employee") Employee employee, 	BindingResult result, 
				Model model,@RequestParam("fileUpload") MultipartFile multipartFile,@PathVariable Integer id,
				HttpServletRequest request) {
			Employee employee01=employeeService.get(id);
			System.out.println("multipartFile::::::"+multipartFile);
			
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), employee=" + employee);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "newEmp";
			}
			try {
				if(multipartFile.isEmpty()) {
					employee.setEmpimg(employee01.getEmpimg());
				}else
				employee.setEmpimg(multipartFile.getBytes());
				Timestamp adminTime = new Timestamp(System.currentTimeMillis());
				employee.setModifDate(adminTime);
			} catch (IOException e) {
				e.printStackTrace();
			}
			Timestamp adminTime = new Timestamp(System.currentTimeMillis());
			employee.setModifDate(adminTime);
			employee.setModifUser("System");
		
			employeeService.update(employee);
			return "redirect:/emp/editEmp?msg=success";
		}
	
	
	@ModelAttribute
	public void commonData(Model model) {
		List<Department> deptList = departmentService.getAllDepartments();
		Map<String, String> rankMap = new HashMap<>();
		Map<String, String> empStatusMap = new HashMap<>();
		rankMap.put("主管", "主管");
		rankMap.put("員工", "員工");
		empStatusMap.put("Y", "開通");
		empStatusMap.put("N", "停權");
		model.addAttribute("deptList", deptList);
		model.addAttribute("rankMap", rankMap);
		model.addAttribute("empStatusMap", empStatusMap);
	}
	
	
	@ModelAttribute
	public void getEmployee(@PathVariable(value="id", required = false ) Integer id, Model model) {
		System.out.println("@ModelAttribute.getEmployee()...");
		if (id != null) {
			Employee employee = employeeService.get(id);
			model.addAttribute("employee", employee);
		} else {
			Employee employee = new Employee();
		//	employee.setLogin("false");
			model.addAttribute("employee", employee);
		}
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
		

}
