<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>
<!-- 로그인 -->
<!-- 오른쪽 정렬-->
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
   
   </head>

	<body>
	    <div class="copyright-agile">
			<p>&copy; 2017 inom ski. All rights reserved | Design by winter_park</p>
		</div>
      
      <!-- js -->
      <script type="text/javascript" src="${project}assets/js/jquery-2.1.4.min.js"></script>
       <script src="${project}member/jquery-barcode.js"></script>
      <script src="${project}assets/js/responsiveslides.min.js"></script>
      
            <script>
         	// 수정폼

                  $(function () {
                     $("#slider").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: true,
                        speed: 1000,
                        namespace: "callbacks",
                        before: function () {
                           $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                           $('.events').append("<li>after event fired.</li>");
                        }
                     });
                  });
               </script>
         
      
         <!-- Portfolio-Popup-Box-JavaScript -->
               <script src="${project}assets/js/jquery.chocolat.js"></script>
               <script type="text/javascript">
                  $(function() {
                     $('.w3portfolioaits-item a').Chocolat();
                  });
               </script>
            <!-- //Portfolio-Popup-Box-JavaScript -->
            <!-- Tour-Locations-JavaScript -->
               <script src="./assets/js/classie.js"></script>
               <script src="./assets/js/helper.js"></script>
               <script src="./assets/js/grid3d.js"></script>
               <script>
                  new grid3D( document.getElementById( 'grid3d' ) );
               </script>
            <!-- //Tour-Locations-JavaScript -->
               <script src="./assets/js/SmoothScroll.min.js"></script>
            <!-- smooth scrolling-bottom-to-top -->
                  <script type="text/javascript">
                     $(document).ready(function() {
                     /*
                        var defaults = {
                        containerID: 'toTop', // fading element id
                        containerHoverID: 'toTopHover', // fading element hover id
                        scrollSpeed: 1200,
                        easingType: 'linear' 
                        };
                     */                        
                     $().UItoTop({ easingType: 'easeOutQuart' });
                     });
                  </script>
                  <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
            <!-- //smooth scrolling-bottom-to-top -->
            <script type="text/javascript">
         jQuery(document).ready(function($) {
            $(".scroll").click(function(event){      
               event.preventDefault();
               $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
         });
      </script>
      <!-- start-smoth-scrolling -->
      <script type="text/javascript" src="./assets/js/move-top.js"></script>
      <script type="text/javascript" src="./assets/js/easing.js"></script>
      <script type="text/javascript" src="./assets/js/bootstrap-3.1.1.min.js"></script>
   </body>

</html>
   
