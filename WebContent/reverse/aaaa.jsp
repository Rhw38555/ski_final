var strfull = fullDate.split('-');
			if(strfull[2].length == 1) strfull[2] = "0"+strfull[2];
			if(strfull[1].length == 1) strfull[1] = "0"+strfull[1];
			strfull = strfull[0]+strfull[1]+strfull[2];
			alert(strfull+"/"+$('#reset_ski_date0').val().substring(8,18));
			
			/*
			var date1 = $("#multipick").datepicker('getDate');
			var fullDate = fulldate(date1);	               	                    
			var cnt = 0;
			var ch = 0;
			var c = 0;
			var cc = 0;
			var ccc = 0;
			
			
			$('.alt').each(function(i,item){	
				alert($(item).text()+"/"+fullDate);
				if($(item).text() == fullDate){
					ch = 1;
					//var firstdate = $('#reset_ski_date'+i).val().substring(8,18);					
					if($('#date'+i).text() == fullDate){
						var cnt2=$('#cnt2_'+i).val();
						var cnt4=$('#cnt2_'+i).val();
						var cnt8=$('#cnt2_'+i).val();
						modcount(firstdate,cnt2,cnt4,cnt8);
					}		
					alert('들어왔');
					$(item).remove();
				}else {
					++cnt;
				}
				++cc;
			});
			
			if(getdateresult == 1){
				if(2 > cc) $('#multipick').datepicker('option','beforeShowDay', gogogo);				
			}else{
				if(ch == 1) setTimeout("getdate()",500);
			}
			if(ch == 0){
				var count = 0;
				$('.alt').each(function(i,t){
					++count;
				});
				if(count == 0){
					$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('#a');
				}else if(count == 1){
					var alt = strdate($('.alt:first').text());
					var sel = strdate(fullDate);
					if(alt < sel){
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('#a');
					}else{
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').prependTo('#a');
					}
				}else if(count >= 2){										
					clearInterval(setdate);					
					var alt1 = strdate($('.alt:first').text());
					var alt2 = strdate($('.alt:eq(1)').text());
					var sel = strdate(fullDate);
					
					aaa = new Array();
					aaa.push($('.alt:first').text());					
					aaa.push($('.alt:eq(1)').text());
					aaa.push(fullDate);
					
					$('#multipick').datepicker('option','maxPicks', '3');
					$('#multipick').datepicker('option','beforeShowDay', gogo);
					//alt1은 alt2보다 작은 상황
					if(sel < alt1){
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').prependTo('#a');
					}else if(sel > alt2){
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('#a');
					}else{
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('.alt:first');
					}
				}
			}
			*/

<%--for="window" event="onunload" language="javascript" --%>
   <script type="text/javascript">
   		browser_Event();
		function browser_Event(){	
			if(event.clientY<0){	
			 	alert("browser closed!!!");	
			 	
			}	
			else{	
				 if(document.readyState=="complete"){	
			 	 //새로고침	
					 alert("새로고침");	
				 }else if(document.readyState=="loading"){	
				 //다른 페이지 이동	
				}	
			}	
		} 
		window.onbeforeunload = function() {
			<% System.out.println("나갔당2");%>
		    return "나가실래요?";
		}
		jQuery(window).bind(
			    "beforeunload", 
			    function() { 
			    	<% System.out.println("나갔당3");%>
			        return confirm("Do you really want to close?") 
			    }
			)
			window.onunload = function() { 
		        if(event.clientX < 0 && event.clientY < 0) { 
		        	<% System.out.println("나갔당4");%>
		            alert("브라우저를 종료하였습니다."); 
		        } 
		  } 
		function closeIt()
		{
			<% System.out.println("나간~~당");%>
		event.returnValue = "나간당333";
		}
		

		var Browser = {
			     chk : navigator.userAgent.toLowerCase()
			 }
			Browser = {
			    ie : Browser.chk.indexOf('msie') != -1,
			    ie6 : Browser.chk.indexOf('msie 6') != -1,
			    ie7 : Browser.chk.indexOf('msie 7') != -1,
			    ie8 : Browser.chk.indexOf('msie 8') != -1,
			    ie9 : Browser.chk.indexOf('msie 9') != -1,
			    ie10 : Browser.chk.indexOf('msie 10') != -1,
			    opera : !!window.opera,
			    safari : Browser.chk.indexOf('safari') != -1,
			    safari3 : Browser.chk.indexOf('applewebkir/5') != -1,
			    mac : Browser.chk.indexOf('mac') != -1,
			    chrome : Browser.chk.indexOf('chrome') != -1,
			    firefox : Browser.chk.indexOf('firefox') != -1
			}
		if(Browser.chrome) {
			<% System.out.println("크롬입니다");%>
			 $(window).bind("beforeunload", function() {
			//실행할 함수를 리턴해야한다.
			<% System.out.println("나~~~간~~당");%>
			  return fn_removeLocalStorage("openchatwait");
			 });
			}else{
				<% System.out.println("크롬아입니다");%>
			}
		onbeforeunload="javascript:fn_removeLocalStorage('openchatwait');"
		
			window.addEventListener("beforeunload", function (e) {
				var confirmationMessage = "\o/";
				
				(e || window.event).returnValue = confirmationMessage; //Gecko + IE
					<% System.out.println("안뇽");%>
					//return confirmationMessage; //Webkit, Safari, Chrome
					//mod();
				});
		
		//unload();
		
		window.addEventListener("beforeunload", function (e) {
		var confirmationMessage = "\o/";
		
		(e || window.event).returnValue = confirmationMessage; //Gecko + IE
			<% System.out.println("안뇽");%>
			//return confirmationMessage; //Webkit, Safari, Chrome
		
		});
		
		function mod(){
			if($('#date1').text() != ''){
				<% System.out.println("mod들어왔다");%>
			}else{
				<% System.out.println("else입");%>
			}
		}
		
		$(window).on('mouseover', (function () {
		    window.onbeforeunload = null;
		}));
		$(window).on('mouseout', (function () {
			<% System.out.println("마우스아웃");%>
		    window.onbeforeunload = ConfirmLeave;
		}));
		function ConfirmLeave() {
		    return "";
		}
		var prevKey="";
		$(document).keydown(function (e) {            
		    if (e.key=="F5") {
		    	<% System.out.println("새로고침");%>
		    	window.onbeforeunload = ConfirmLeave;
		        
		    }
		    else if (e.key.toUpperCase() == "W" && prevKey == "CONTROL") {  
		    	<% System.out.println("ㅉ?");%>
		        window.onbeforeunload = ConfirmLeave;   
		    }
		    else if (e.key.toUpperCase() == "R" && prevKey == "CONTROL") {
		    	<% System.out.println("ㄲ?");%>
		    	window.onbeforeunload = ConfirmLeave;
		    }
		    else if (e.key.toUpperCase() == "F4" && (prevKey == "ALT" || prevKey == "CONTROL")) {
		    	<% System.out.println("d이건뭐야");%>
		    	window.onbeforeunload = ConfirmLeave;
		    }
		    prevKey = e.key.toUpperCase();
		});
   </script>
   
  window.onunload = function() { 
        if(event.clientX < 0 && event.clientY < 0) { 
            alert("브라우저를 종료하였습니다."); 
        } 
  } 
  window.onbeforeunload = fn_onClose;
	    function fn_onClose(){

	         alert('나강당');
	        }
	        
	        
	       <%-- 
	        /*
            if(getdateresult == 0){
            	a = new Array();
            	//alert(arrdate.length);
            	var recount = 0;
            	//for(var i=0; i<arrdate.length; i++){
            		var day = strdate(arrdate[0]);
            		//alert(arrdate[0]);
            		if(mydate.getDate()+2 == day.getDate() || mydate.getDate()+1 == day.getDate()){
            			mydate.setDate (day.getDate());
            		}else{
            			mydate.setDate (mydate.getDate() + 3);
            			//++recount;
            		}
            	//}
            	if(recount == arrdate.length){
            		mydate.setDate (mydate.getDate() + 3);
            	}
            }else{
            	mydate.setDate (mydate.getDate() + 3);
            }
            */
             --%>