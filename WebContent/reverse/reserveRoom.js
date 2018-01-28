/**

 * 
 */
var setdate = 0;
var setcount = 0;
var a = null;
$(document).ready(function(){
/*///////////////////////////////////////
 * 		load
/*///////////////////////////////////////	
	//setdate = setInterval("getdate()",1000);
	/*
	window.addEventListener("beforeunload", function (e) {
		var confirmationMessage = "\o/";	
		(e || window.event).returnValue = confirmationMessage; //Gecko + IE			
			return confirmationMessage; //Webkit, Safari, Chrome
			//modcount();
			hello();
	});
	*/
	/*
	$(window).unload( function (){ 
		alert("Bye now!"); 
	});
*//*
	window.addEventListener("beforeunload", function (event) {
	 // event.returnValue = "진짜 나감?";
	 hello();
	 <%System.out.println("나갈게");%>
	});
	*/
	function hello(){		
		alert('hi');
	}
	
	setTimeout("getdate()",1000);
	load();
	function load(){
		$('#box2').css('display','none');
	    $('#box3').css('display','none');
	    $('#paybt').css('display','none');
	    $('#resetbt').css('display','none');
	    $('#backbt').css('display','none');
	    $('#box2').css('display','none');
		$('#cnt1').val(0);
		$('#cnt2').val(0);
		$('#cnt3').val(0);
	    $('#datepicker1').datepicker('option', 'disabled', false);
	    $('#datepicker2').datepicker('option', 'disabled', false);
	    $('#datepicker1').datepicker('setDate','');
	    $('#datepicker2').datepicker('option', 'minDate', '0');
	    $('#datepicker2').datepicker('option', 'maxDate', '');
	    $('#datepicker2').datepicker('setDate','');
	    $('#re').text('');
	    $('#re2').text('');
	    $('#bt1').css('display','');
		$('#ta > tr').remove();
		$('#name').val('');
		$('#tel').val('');
		$('#carnum').val('');
		for(var i=0; i<3; i++){
			$('#mran2_'+i).attr('disabled', false);
			$('#mran4_'+i).attr('disabled', false);
			$('#mran8_'+i).attr('disabled', false);
			$('#pran2_'+i).attr('disabled', false);
			$('#pran4_'+i).attr('disabled', false);
			$('#pran8_'+i).attr('disabled', false);
			
			$('#cnt2_'+i).val(0);
			$('#cnt4_'+i).val(0);
			$('#cnt8_'+i).val(0);
		}
		/*
		$('#ran1').attr('disabled', false);
	    $('#ran2').attr('disabled', false);
	    $('#ran3').attr('disabled', false);
	    $('#ran4').attr('disabled', false);
	    $('#ran5').attr('disabled', false);
	    $('#ran6').attr('disabled', false);
	    */
	    $('#roompricebox').text('');
	}	
	
/*///////////////////////////////////////
 * 		달력1 / 2
/*///////////////////////////////////////       
   var date1 = null;
   function fulldate(date){
		var day1 = date.getDate();                 
	    var month1 = date.getMonth() + 1;             
	    var year1 = date.getFullYear();
	    var fullDate = year1 + "-" + month1 + "-" + day1; 
	    return fullDate;
	}//fulldate

	function strdate(date){
		var str = date.split('-');
		var day = new Date(str[0],str[1],str[2]);	
		return day;
	}//String to Date
	
	function strMindate(date){
		var str = date.split('-');
		var day = new Date(str[0],str[1]-1,str[2]);	
		return day;
	}//String to Date
	
    $('#datepicker1').datepicker({
        dateFormat: 'yy-mm-dd',
        inline: true,
        minDate: 0,
        maxDate: 100,
        onSelect: function(){  
            date1 = $("#datepicker1").datepicker('getDate');
            var day1 = $("#datepicker1").datepicker('getDate').getDate();                 
            var month1 = $("#datepicker1").datepicker('getDate').getMonth() + 1;             
            var year1 = $("#datepicker1").datepicker('getDate').getFullYear();
            var fullDate = year1 + "-" + month1 + "-" + day1;            
            
            var mydate = new Date(date1);
            
            if(getdateresult == 0){
            	a = new Array();;
            	var recount = 0;
            	var rere = 0;

        		var mydate_1 = strMindate(year1 + "-" + month1 + "-" + (++day1));
        		var mydate_2 = strMindate(year1 + "-" + month1 + "-" + (day1 += 1));        		
        		//alert(mydate_1+"/"+mydate_2+"/"+day);
        		var strmy_1 = fulldate(mydate_1);      		
        		var strmy_2 = fulldate(mydate_2);
        		
            	for(var i=0; i<arrdate.length; i++){
            		//alert(strmy_1 + "/"+strday);
            		var day = strMindate(arrdate[i]);
            		var strday = fulldate(day);
            		if(strmy_1 == strday){
            			alert('같당1');
            			mydate.setDate (day.getDate());
            			rere = 1;
            		}else if(strmy_2 == strday){
            			
            			if(rere == 0){
            				alert('같당2');
            				mydate.setDate (day.getDate());
            			}
            		}else{
            			//alert('아니당');
            			++recount;
            		}
            	}
            	
            	if(recount == arrdate.length){
            		mydate.setDate (mydate.getDate() + 3);
            	}
            }else{
            	mydate.setDate (mydate.getDate() + 3);
            }
            $('#datepicker2').datepicker('option', 'maxDate', mydate);
            $('#datepicker2').datepicker('option', 'minDate', date1);
            //clearInterval(setdate);	
            $('#re').text(fullDate);
        }
    });// Datepicker1
    
    $('#datepicker2').datepicker({
        dateFormat: 'yy-mm-dd',
        inline: true,
        minDate: 0,
        onSelect: function(){
        	if($('#re').text() == ''){
        		alert('체크인 날짜를 먼저 선택해주세요');
        		return;
        	}
            var day1 = $("#datepicker2").datepicker('getDate').getDate();                 
            var month1 = $("#datepicker2").datepicker('getDate').getMonth() + 1;             
            var year1 = $("#datepicker2").datepicker('getDate').getFullYear();
            var fullDate = year1 + "-" + month1 + "-" + day1;
            $('#re2').text(fullDate);
        }
    });// Datepicker2
    
/*///////////////////////////////////////
 * 		+ - 클릭
/*///////////////////////////////////////    
    $('.__count_range input[count_range]').click(function(e){
        e.preventDefault();
        var type = $(this).attr('count_range');
        var $count = $(this).parent().children('input.count');
        var count_val = $count.val(); // min 1
        if(type=='m'){
            if(count_val<1){
                return;
            }
            $count.val(parseInt(count_val)-1);
        }else if(type=='p'){
           if(count_val>9){
               return;
            }
            $count.val(parseInt(count_val)+1);     
        }
        price();
    });
    
/*///////////////////////////////////////
 * 		'다음' '이전으로' 클릭시
/*///////////////////////////////////////    
    $('#bt1').click(function(){
   	 if( $('#re').text() == '' ){
   		 alert('체크인 날짜를 선택해주세요');
   		 return false;
   	 }else if( $('#re2').text() == '' ){
   		 alert('체크아웃 날짜를 선택해주세요');
   		 return false;
   	 }else if($('#re2').text() == $('#re').text()){
   		 alert('체크인과 체크아웃 날짜가 같습니다');
   		 return false;
   	 }else{
   		 var dat1 = new Date($("#datepicker1").datepicker("getDate"));
   		 var dat2 = new Date($("#datepicker2").datepicker("getDate"));
   		 var time = (dat2 - dat1)/(24 * 60 * 60 * 1000);
            $('<tr>'
             +'   <th>체크인</th>'
             +'   <td id="checkin">'+$('#re').text()+'</td>'
             +'</tr>'
             +'<tr>'
             +'   <th>체크아웃</th>'
             +'   <td id="checkout">'+$('#re2').text()+'</td>'
             +'</tr>'
             +'<tr>'
             +'   <th>숙박일수</th>'
             +'   <td id="roomdate">'+time+'</td>'
             +'</tr>'
            ).appendTo('#ta');
            $('#datepicker1').datepicker('option', 'disabled', true);
            $('#datepicker2').datepicker('option', 'disabled', true);
            $('#box2').css('display','');
            $('#bt1').css('display','none');
            $('#backbt1').css('display','');
            $('#bt2').css('display','');
            $('#date1').text('');
            $('#date2').text('');
            $('#date3').text('');
            
            if(time >= 1){
           	 $('#date1').text($('#re').text());
           	 $('#roomdate2').css('display','none');
           	 $('#roomdate3').css('display','none');
           	 
           	 if(time >= 2){
           		 var date2 = new Date($('#re').text());
                 date2.setDate (date2.getDate() + 1);
                 var day = date2.getDate();                 
                 var month = date2.getMonth() + 1;             
                 var year = date2.getFullYear();
                 var datestr = year + "-" + month + "-" + day; 
                 $('#date2').text(datestr);
           		 $('#roomdate2').css('display','');
           		 
           		 if(time >= 3){
           			 date2.setDate (date2.getDate() + 1);
           			 day = date2.getDate();                 
                     month = date2.getMonth() + 1;             
                     year = date2.getFullYear();
                     datestr = year + "-" + month + "-" + day; 
           			 $('#date3').text(datestr);
           			 $('#roomdate3').css('display','');
           		 }
           	   }
            }
            setcount = setInterval("getcount()",1000);
   	 	}                
   }); //bt1
    
   $('#bt2').click(function(){    	
    var cnt1 = parseInt($('#cnt2_0').val())+parseInt($('#cnt4_0').val())+parseInt($('#cnt8_0').val());
    var cnt2 = parseInt($('#cnt2_1').val())+parseInt($('#cnt4_1').val())+parseInt($('#cnt8_1').val());
    var cnt3 = parseInt($('#cnt2_2').val())+parseInt($('#cnt4_2').val())+parseInt($('#cnt8_2').val());
       
    if($('#roomdate1').css('display','')){
	   	if(cnt1 < 1){
	   		alert($('#date1').text()+'일에 1개 이상 객실을 선택해주세여1');
	        return false;
	   	}	   	
    }
    if($('#date2').text() != ''){
	   	if(cnt2 < 1){
	   		alert($('#date2').text()+'일에 1개 이상 객실을 선택해주세여2');
	        return false;
	   	}	   	
    }
    if($('#date3').text() != ''){
	   	if(cnt3 < 1){
	   		alert($('#date3').text()+'일에 1개 이상 객실을 선택해주세여3');
	        return false;
	   	}	   	
    }
    
    showstep3();
    clearInterval(setcount);
  });//bt2
   
   $('#bt3').click(function(){
	   if( $('#name').val() == '' ){
		   alert('이용자 이름을 입력해주세요');
		   return false;
	   }else if( $('#tel').val() == '' ){
		   alert('전화번호를 입력해주세요');
		   return false;
	   }else if( isNaN(reverseform.tel.value)){
		   alert('숫자를 입력하세요.');
		   return false;
	   }else if ($('#carnum').val() != '') {
		   if(isNaN(reverseform.carnum.value)) {
			   alert('숫자를 입력하세요.');
			   return false;
		   }
	   }else{
		   $('#paybt').css('display','');
		   $('#bt3').css('display','none');
		   $('#backbt2').css('display','none');
		   
		   var roomstr = $('#date1').text()+",";
		   var roomcnt = $('#cnt2_0').val()+","+$('#cnt4_0').val()+","+$('#cnt8_0').val()+",";
		   if($('#date2').text() != ''){
			   roomstr += $('#date2').text()+",";
			   roomcnt += $('#cnt2_1').val()+","+$('#cnt4_1').val()+","+$('#cnt8_1').val()+",";
			   	if($('#date3').text() != '') {			   		
			   		roomstr += $('#date3').text();		
			   		roomcnt += $('#cnt2_2').val()+","+$('#cnt4_2').val()+","+$('#cnt8_2').val();
			   	}
		   }
		   $('#room_check').val($('#checkin').text()+"/"+$('#checkout').text());
		   $('#room_date').val(roomstr);
		   $('#room_cnt').val(roomcnt);
		   $('#room_price').val($('#roompricebox').text());
		   
		   $('<tr>'
	        +'<th>이용자명</th> <td>'+($('#name').val())+'</td>'
	        +'</tr>'
	        +'<tr>'
	        +'<th>전화번호</th> <td>'+($('#tel').val())+'</td>'
	        +'</tr>'
	        +'<tr>'
	        +'<th>차량번호</th> <td>'+($('#carnum').val())+'</td>'
	        +'</tr>'
	       ).appendTo('#ta'); 
	   }
   });//bt3

   $('#backbt1').click(function(){
	   modcount();
	   $('.count').each(function(i,t){
		   $(t).val('0');
	   });
       $('#datepicker1').datepicker('option', 'disabled', false);
       $('#datepicker2').datepicker('option', 'disabled', false);
       $('#box2').css('display','none');
       $('#box3').css('display','none');
       $('#paybt').css('display','none');
       $('#resetbt').css('display','none');
       $('#backbt').css('display','none');
       $('#box2').css('display','none');
       $('#bt1').css('display','');
   	   $('#ta > tr').remove();
   	   $('#roompricebox').text('');
	}); //backbt1
	
	$('#backbt2').click(function(){
		$('#box3').css('display','none');
		$('.ran').each(function(i,t){
			$(t).attr('disabled', false);
		});
	    $('#name').val('');
	   	$('#tel').val('');
	   	$('#carnum').val('');
	   	$('#tt1').remove();
	   	$('#tt2').remove();
	   	$('#tt3').remove();
	   	$('#tt4').remove();
	   	$('#bt2').css('display','');
	   	$('#roompricebox').text('');
	   	setcount = setInterval("setcount()",1000);
	}); //backbt2
	
	$('#resetbt').click(function(){
		
		load();
	});
   
   function showstep3(){
  	 $('<tr id="tt1">'
        +'<th>2인실</th> <td>'+(parseInt($('#cnt2_0').val())+parseInt($('#cnt2_1').val())+parseInt($('#cnt2_2').val()))+'</td>'
        +'</tr>'
        +'<tr id="tt2">'
        +'<th>4인실</th> <td>'+(parseInt($('#cnt4_0').val())+parseInt($('#cnt4_1').val())+parseInt($('#cnt4_2').val()))+'</td>'
        +'</tr>'
        +'<tr id="tt3">'
        +'<th>8인실</th> <td>'+(parseInt($('#cnt8_0').val())+parseInt($('#cnt8_1').val())+parseInt($('#cnt8_2').val()))+'</td>'
        +'</tr>'
        +'<tr id="tt4">'
        +'<th>총 가격</th> <td>'+$('#roompricebox').text()+'</td>'
        +'</tr>'
       ).appendTo('#ta'); 
       
       $('#box3').css('display','');
       $('#bt2').css('display','none');
       $('#bt3').css('display','');
       $('#resetbt').css('display','');
       $('#backbt1').css('display','none');
       $('.ran').each(function(i,t){
    	   $(t).attr('disabled', '');
       });
   } //showstep3
    
   function price(){
   	var price=(parseInt($('#cnt2_0').val())*20000)
		     +(parseInt($('#cnt2_1').val())*20000)
		     +(parseInt($('#cnt2_2').val())*20000)
		     +(parseInt($('#cnt4_0').val())*40000)
		     +(parseInt($('#cnt4_1').val())*40000)
		     +(parseInt($('#cnt4_2').val())*40000)
		     +(parseInt($('#cnt8_0').val())*80000)
		     +(parseInt($('#cnt8_1').val())*80000)
		     +(parseInt($('#cnt8_2').val())*80000);  	
     $('#roompricebox').text(price); 
   } //price
   
   $(document).on('click','#mran2_0',function(e){
		insertcnt($('#date1').text(),'1','room_2');		
	}); // 첫날 오전 -
	
	$(document).on('click','#pran2_0',function(e){
		insertcnt($('#date1').text(),'2','room_2');		
	}); // 첫날 오전 +
	
	$(document).on('click','#mran4_0',function(e){
		insertcnt($('#date1').text(),'1','room_4');		
	}); // 첫날 야간 -
	
	$(document).on('click','#pran4_0',function(e){
		insertcnt($('#date1').text(),'2','room_4');		
	}); // 첫날 야간 +
	
	$(document).on('click','#mran8_0',function(e){
		insertcnt($('#date1').text(),'1','room_8');
	}); // 첫날 종일 -
	
	$(document).on('click','#pran8_0',function(e){
		insertcnt($('#date1').text(),'2','room_8');		
	}); // 첫날 종일 +
   
    $(document).on('click','#mran2_1',function(e){
		insertcnt($('#date2').text(),'1','room_2');
	}); // 둘째날 오전 -
	
	$(document).on('click','#pran2_1',function(e){
		insertcnt($('#date2').text(),'2','room_2');			
	}); // 둘째날 오전 +
	
	$(document).on('click','#mran4_1',function(e){
		insertcnt($('#date2').text(),'1','room_4');
	}); // 둘째날 야간 -
	
	$(document).on('click','#pran4_1',function(e){
		insertcnt($('#date2').text(),'2','room_4');			
	}); // 둘째날 야간 +
	
	$(document).on('click','#mran8_1',function(e){
		insertcnt($('#date2').text(),'1','room_8');
	}); // 둘째날 종일 -
	
	$(document).on('click','#pran8_1',function(e){
		insertcnt($('#date2').text(),'2','room_8');			
	}); // 둘째날 종일 +
   
   $(document).on('click','#mran2_2',function(e){
		insertcnt($('#date3').text(),'1','room_4');			
	}); // 셋째날 오전 -
	
	$(document).on('click','#pran2_2',function(e){
		insertcnt($('#date3').text(),'2','room_2');			
	}); // 셋째날 오전 +
	
	$(document).on('click','#mran4_2',function(e){
		insertcnt($('#date3').text(),'1','room_4');
	}); // 셋째날 야간 -
	
	$(document).on('click','#pran4_2',function(e){
		insertcnt($('#date3').text(),'2','room_4');			
	}); // 셋째날 야간 +
	
	$(document).on('click','#mran8_2',function(e){
		insertcnt($('#date3').text(),'1','room_8');
	}); // 셋째날 종일 -
	
	$(document).on('click','#pran8_2',function(e){
		insertcnt($('#date3').text(),'2','room_8');			
	}); // 셋째날 종일 +
   
});//ready
 
////////////////////////////////////////////////////

///////////////////////////////////////////////////

var aaa = null;
var arrdate = null;
var getdateresult = 0;

function getdate(){
	//alert('getdate 돈다');
	$.ajax(
		{
			url : 'selectRoomdate.do',
			dataType : 'xml',
			success : function(data){
				$('#result').text('getdate 성공');
				var code = $(data).find('code').text();
				if(code == "success"){
					var dates = eval("("+$(data).find('dates').text()+")");
					arrdate = new Array();
					$(dates.room).each(function(index,item){
						var d = item.room_date.split(' ');
						arrdate.push(d[0]);				
					}); // 오전오후종일권 다 찬 날짜는 아예 막기
					$('#datepicker1').datepicker('option','beforeShowDay', go1);
					//$('#datepicker2').datepicker('option','beforeShowDay', go2);
					$('#result').text('getdate success');
				}else{
					$('#result').text('getdate 값없음');
					getdateresult = 1;
				}			
			},
			error : function(e){
				$('#result').html('getdate 실패 : '+e);
			}
		}		
	);//ajax
}// getdate

function go1(date){
	if(arrdate.indexOf($.datepicker.formatDate('yy-mm-dd', date)) != -1) 
		return [false, "arrdate", "블록"];		 
    else return [true, "", ""];
} //beforeShowDay 1

function go2(date){
	if(arrdate.indexOf($('#datepicker2').datepicker.formatDate('yy-mm-dd', date)) != -1) 
		return [false, "arrdate", "블록"];		 
    else return [true, "", ""];
} //beforeShowDay 2

function gogo(date) { 
   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
   for (i = 0; i < aaa.length; i++) { 
       if($.inArray(y + '-' +(m+1) + '-' + d,aaa) != -1)  return [true];         
   } 
   return [false]; 
}

function gogogo(date){
	return [true, "", ""];
}

function getcount(){
	$('.date').each(function(i,t) {
		if($(t).text() == '') return;
		var str = $(t).text().split('-');
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];		
		$.ajax(
			{
				url : 'selectRoomCount.do',
				dataType : 'xml',
				data : {
					room_date : d
				},
				success : function(data){
					var dates = eval("("+$(data).find('dates').text()+")");
					var code = $(data).find('code').text();
					if(code == 'success'){
						if(Number(dates.room_2) > 3){
	                        $('#mran2_'+i).attr('disabled', true);
	                        $('#pran2_'+i).attr('disabled', true);
	                        if($('#cnt2_'+i).val() > 0){
	                        	$('#mran2_'+i).attr('disabled', false);
							}
	                      
	                    }else{
	                    	 $('#mran2_'+i).attr('disabled', false);
		                     $('#pran2_'+i).attr('disabled', false);
	                    }
						 if(Number(dates.room_4) > 3){
	                        $('#mran4_'+i).attr('disabled', true);
	                        $('#pran4_'+i).attr('disabled', true);
	                        if($('#cnt4_'+i).val() > 0){
	                        	$('#mran4_'+i).attr('disabled', false);
							}
	                     }else{
	                    	 $('#mran4_'+i).attr('disabled', false);
		                     $('#pran4_'+i).attr('disabled', false);
	                    }
	                     if(Number(dates.room_8) > 3){
	                        $('#mran8_'+i).attr('disabled', true);
	                        $('#pran8_'+i).attr('disabled', true);
	                        if($('#cnt8_'+i).val() > 0){
	                        	$('#mran8_'+i).attr('disabled', false);
							}
	                     } 	else{
	                    	 $('#mran8_'+i).attr('disabled', false);
		                     $('#pran8_'+i).attr('disabled', false);
	                    } 						
	                     $('#result2').text('getcount code 성공!!');
					}else{
						$('#result2').text('getcount 값 없음');
					}					                    
					$('#result').text('getcount 성공');
				},
				error : function(e){
					$('#result').html('getcount 실패'+e);
				}
			}		
		);//ajax
	});//.date	
}// getcount

function insertcnt(day,check,time){			
	//alert(day+"/"+check+"/"+time);
	var str = day.split('-');
	if(str[2].length == 1) str[2] = '0'+str[2];
	if(str[1].length == 1) str[1] = '0'+str[1];
	var d = str[0]+str[1]+str[2];	
	//alert(d+"/"+check+"/"+time);
	$.ajax({
		url : 'insertRoomCount.do',
		dataType : 'xml',
		data : {
			room_check : check,
			room_time : time,
			room_date : d
		},
		success : function(data){
			var code = $(data).find('code').text();
			if(code == 'success'){
				$('#result2').text('중간 db 성공');
				$('#result').text($(data).find('content').text());
			}else if(code == 'fail'){
				$('#result2').text('중간 db 수정실패');
			}else{
				$('#result2').text('중간 db 값이 0');
			}				
		},
		error : function(e){
			$('#result2').text('중간 db 접속 실패');
		}
	});	
}//중간디비 넣기
         

function modcount(){
	$('.date').each(function(i,t) {
		if($(t).text() == '') return;
		var str = $(t).text().split('-');
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];
		var room_2 = $('#cnt2_'+i).val();
		var room_4 = $('#cnt4_'+i).val();
		var room_8 = $('#cnt8_'+i).val();
				
		$.ajax(
			{
				url : 'modifyRoomCount.do',
				dataType : 'xml',
				data : {
					room_date : d,
					room_2 : parseInt(room_2),
					room_4 : parseInt(room_4),
					room_8 : parseInt(room_8)
				},
				success : function(data){
					var code = $(data).find('code').text();
					if(code == 'success'){									
	                    $('#result4').text('modcount code 성공!!');
					}else{
						$('#result4').text('modcount code 실패');
					}					                    
					$('#result3').text('modcount 성공');
				},
				error : function(e){
					$('#result3').html('modcount 실패'+e);
				}
			}		
		);//ajax
	});//.date	
} // modcount 중간디비 빼기


