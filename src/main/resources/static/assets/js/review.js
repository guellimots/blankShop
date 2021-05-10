var reviewCount=0;


$(function(){

        var productId=$('#productID').val();
        var memberId=$('#memberId').val();

       
        $.ajax({

            url: "/blankShop/frontEnd/product/reviews/"+productId,                        
            type: 'GET',        
            dataType:'json',
            error: function (xhr, status, error) { 
            console.log(error)},
            success:function(data){
                var reviewContainer=document.querySelector(".review-wrapper");
                $("#review-count").html("評論 ("+data.length+")");
                reviewCount=data.length;
                for(var i=0; i<data.length; i++){
                    if(data[i].memberId==memberId){
                        var review=`
                    <div class="single-review">
                        <div class="review-img">
                            <img
                                src="${data[i].profileImgSrc}"
                                alt="">
                        </div>
                        <div class="review-content">
                            <p>${data[i].reviewContent}</p>
                            <div class="review-top-wrap">
                                <div class="review-name">
                                    <h4>${data[i].reviewName}</h4>
                                </div>
                            </div>
                        </div>
                        <div>
                            <input type="hidden" value="${data[i].reviewId}">
                        </div>
                        <div class="delete-box">
                            <i class="sli sli-close delete-msg-btn"> 刪除留言</i>
                        </div>
                    </div>                        
                        `;

                        reviewContainer.innerHTML+=review;
                    }
                    else{

                        var review=`
                    <div class="single-review">
                        <div class="review-img">
                            <img
                                src="${data[i].profileImgSrc}"
                                alt="">
                        </div>
                        <div class="review-content">
                            <p>${data[i].reviewContent}</p>
                            <div class="review-top-wrap">
                                <div class="review-name">
                                    <h4>${data[i].reviewName}</h4>
                                </div>
                            </div>
                        </div>
                        <div>
                             <input type="hidden" value="${data[i].reviewId}">
                        </div>
                    </div>           
                        `;

                        reviewContainer.innerHTML+=review;

                    }
                }

            }
        })
    
    }


);


$("#reviewForm").submit(
    

    function(e){
        
        e.preventDefault();
        var productId=$('#productID').val();
        var memberId=$('#memberId').val();
        var reviewName=$('#name').val();
        var reviewContent=$('#review').val();
        $.ajax({
            type:'POST',
            url:'/blankShop/frontEnd/product/reviews/'+productId,
            data:{memberId: memberId, reviewName:reviewName, reviewContent:reviewContent},
            error: function (xhr, status, error) { 
                console.log(error)},
            success:function(data){
            reviewCount++;
            $("#review-count").html("評論 ("+reviewCount+")");
               var reviewContainer=document.querySelector(".review-wrapper");
               var review=`
            <div class="single-review">
               <div class="review-img">
                   <img
                       src="${data.profileImgSrc}"
                       alt="">
               </div>
               <div class="review-content">
                   <p>${data.reviewContent}</p>
                   <div class="review-top-wrap">
                       <div class="review-name">
                           <h4>${data.reviewName}</h4>
                       </div>
                   </div>
                   
               </div>
               <div>
                    <input type="hidden" value="${data.reviewId}">
               </div>
               <div class="delete-box">
                    <i class="sli sli-close delete-msg-btn"> 刪除留言</i>
               </div>
           </div>
               `;

               reviewContainer.innerHTML+=review;
            }
        })

    }

);

$(document).on("click", ".delete-box",function(){
    
    Swal.fire({
        text: "確定要刪除這筆評論？",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '確定',
        cancelButtonText: '取消',
      }).then((result) => {
        if (result.isConfirmed) {

            var reviewId=$(this).prev().find("input").val();

            $.ajax({
                type:'DELETE',
                url:'/blankShop/frontEnd/product/reviews/'+reviewId,
                error: function (xhr, status, error) { 
                    console.log(error)},
                success: function(){

                    Swal.fire(
                        '',
                        '刪除成功',
                        'success'
                    );

                    $(this).parent().remove();
                    reviewCount--;
                    $("#review-count").html("評論 ("+reviewCount+")");
                }.bind(this)
            })
        }
      })

   }
);

