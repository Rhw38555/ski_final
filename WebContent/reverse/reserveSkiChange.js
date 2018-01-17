/**
 * 
 */
   
   var aaa = null;
   var arrdate = null;
   var setdate = 0;
   var setcount = 0;
   var getdateresult = 0;
   var firstcheck = 0;
   var firstarr = new Array();
   
$(function(){
   /*
   window.addEventListener("beforeunload", function (e) {
      var confirmationMessage = "\o/";   
      (e || window.event).returnValue = confirmationMessage; //Gecko + IE   
         modcount();      
         return confirmationMessage; //Webkit, Safari, Chrome
         
   });
   */
   for(var i=0; i<3; i++){
	   $('#skidate'+i).css('display','none');
	   $('#skiski_'+i).css('display','none');
	  // $('#date'+i).text('');
   }
   for(var i=0; i<$('#datecnt').val(); i++){
      //++i;
	  $('#skidate'+i).css('display','');
	  $('#skiski_'+i).css('display','');
	  $('#skidateval'+i).val('1');
      var firstdate = fulldate(new Date($('#date'+i).text()));      
      firstarr.push(firstdate);
      $('<div class="alt" id="alt_'+ firstdate +'">'+firstdate+'</div>').appendTo('#a');
      $('#date'+i).text(firstdate);
   }
   
/*///////////////////////////////////////
 *       document.ready
/*///////////////////////////////////////   
   setInterval("getcount()",1000);
   
/*///////////////////////////////////////
 *       달력 클릭시
/*///////////////////////////////////////
   $('#multipick').multiDatesPicker({
      maxPicks: 3,
      minDate: 0,
      maxDate: 100,
      beforeShowDay: firstgo,
      onSelect : function(){   
         setTimeout("getdate()",1000);
         //$('#multipick').datepicker('option','beforeShowDay', gogogo);  
         var date1 = $("#multipick").datepicker('getDate');
         var fullDate = fulldate(date1);                                         
         var cnt = 0;
         var ch = 0;
         var c = 0;
         var cc = 0;
         var ccc = 0;
         var removecnt = 0;
         $('.alt').each(function(i,item){   
            
            var it = $(item).text();
           // alert("있는날짜: "+it+"/"+"선택날짜: "+fullDate);
            if(it.length > 10) it = it.substring(0,9);
          // alert(it.length+"/"+it.substring(0,9));
            if(it == fullDate){
               ch = 1;
               $(item).remove();   
               removecnt = 1;
            }else {
               ++cnt;
            }
            ++cc;
         });
         
         if(removecnt == 1){
        	 for(var i=0; i<3; i++){
        		 var oday = fulldate(new Date(strMindate($('#date'+i).text())));
                 //alert($('#date'+i).text());
                 //alert(oday + "/" + fullDate);
                 if(oday == fullDate){
                    //alert('oday==fulldate');
                    var cnt2=$('#cnt2_'+i).val();
                    var cnt4=$('#cnt4_'+i).val();
                    var cnt8=$('#cnt8_'+i).val();
                    $('#multipick').datepicker('option','beforeShowDay', gogogo);
                    modcount(oday,cnt2,cnt4,cnt8);
                    removedate(oday,i);
                 }
        	 }
         }
         
         if(getdateresult == 1){
            $('#multipick').datepicker('option','beforeShowDay', gogogo);               
         }else{
            //if(cnt < 3) setTimeout("getdate()",500);
         }
         
         if(ch == 0){
        	showstep2(fullDate);
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
                  $('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').prependTo('.alt:first');
               }
            }else if(count >= 2){                              
               clearInterval(setdate);               
               var alt1 = strdate($('.alt:first').text());
               var alt2 = strdate($('.alt:eq(1)').text());
               var sel = strdate(fullDate);
               
               aaa = new Array();
               aaa.push($('.alt:first').text());
               if(aaa[0].length > 10) aaa[0] = aaa[0].substring(0,9);
               aaa.push($('.alt:eq(1)').text());
               aaa.push(fullDate);
              //alert("배열:"+aaa[0]+"/"+aaa[1]+"/"+aaa[2]);
               $('#multipick').datepicker('option','maxPicks', '3');
               $('#multipick').datepicker('option','beforeShowDay', gogo);
               //alt1은 alt2보다 작은 상황
               if(sel < alt1){
                  $('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').prependTo('#a');
               }else if(sel > alt2){
                  $('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('#a');
               }else{
                  $('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').insertAfter('.alt:first');
               }
            }
         }   
      }
   });   //multiDatesPicker   
   
   function removedate(day,num){
      for(var i=0; i<3; i++){
         var full = fulldate(new Date(strMindate($('#date'+i).text())))
         //alert(day+"/"+full);
         if(day == full){
            $('#cnt2_'+i).val('0');
            $('#cnt4_'+i).val('0');
            $('#cnt8_'+i).val('0');
            $('#date'+i).text('');
            $('#skidateval'+i).val(0);
            $('#ski_date_'+i).text('');
            $('#ski2_'+i).text('0');
            $('#ski4_'+i).text('0');
            $('#ski8_'+i).text('0');
            $('#skiski_'+i).css('display','none');
         }
         if($('#date'+i).text() == ''){
            $('#skidate'+i).css('display','none');
         }
      }
      price();
   }
   
   function showstep2(day){
	   for(var i=0; i<3; i++){
		   if($('#skidateval'+i).val() == 0){
			   $('#date'+i).text(day);
			   $('#skidate'+i).css('display','');
			   $('#skidateval'+i).val(1);
			   $('#skiski_'+i).css('display','');
			   $('#ski_date_'+i).text(day);
			   return;
		   }
	   }
   }
/*///////////////////////////////////////
 *       + - 클릭시
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
       cnttable();
   }); // skicount
   
   function cnttable(){
	   for(var i=0; i<3; i++){
		   $('#ski2_'+i).text($('#cnt2_'+i).val());
		   $('#ski4_'+i).text($('#cnt4_'+i).val());
		   $('#ski8_'+i).text($('#cnt8_'+i).val());
	   }
   }
   
   function price(){
	   var price = 0;   
       $('.date').each(function(i,t){
          var c2 = $('#cnt2_'+i).val();
          var c4 = $('#cnt4_'+i).val();
          var c8 = $('#cnt8_'+i).val();
          if(c2 == "예약끝") c2 = 0;           
          if(c4 == "예약끝") c4 = 0;          
          if(c8 == "예약끝") c8 = 0;          
          price += parseInt(c2)*20000
                    +parseInt(c4)*30000
                    +parseInt(c8)*40000;                 
       });
       $('#skipricebox').text(price); 
   }
   
   
   $('#mran2_0').click(function(){
	   insertcnt($('#date0').text(),'1','ski_morning'); 
	   
   });
   
   $('#pran2_0').click(function(){
      insertcnt($('#date0').text(),'2','ski_morning');      
   }); // 첫날 오전 +
   
   $('#mran4_0').click(function(){
      insertcnt($('#date0').text(),'1','ski_night');      
   }); // 첫날 야간 -
   
   $('#pran4_0').click(function(){
      insertcnt($('#date0').text(),'2','ski_night');      
   }); // 첫날 야간 +
   
   $('#mran8_0').click(function(){
      insertcnt($('#date0').text(),'1','ski_day');
   }); // 첫날 종일 -
   
   $('#pran8_0').click(function(){
      insertcnt($('#date0').text(),'2','ski_day');      
   }); // 첫날 종일 +
   
   if($('#date1')){
	  $('#mran2_1').click(function(){
         insertcnt($('#date1').text(),'1','ski_morning');
      }); // 둘째날 오전 -
      
	  $('#pran2_1').click(function(){
         insertcnt($('#date1').text(),'2','ski_morning');         
      }); // 둘째날 오전 +
      
	  $('#mran4_1').click(function(){
         insertcnt($('#date1').text(),'1','ski_night');
      }); // 둘째날 야간 -
      
	  $('#pran4_1').click(function(){
         insertcnt($('#date1').text(),'2','ski_night');         
      }); // 둘째날 야간 +
      
	  $('#mran8_1').click(function(){
         insertcnt($('#date1').text(),'1','ski_day');
      }); // 둘째날 종일 -
      
	  $('#pran8_1').click(function(){
         insertcnt($('#date1').text(),'2','ski_day');         
      }); // 둘째날 종일 +
   }
   
   if($('#date2')){
	  $('#mran2_2').click(function(){
         insertcnt($('#date2').text(),'1','ski_morning');         
      }); // 셋째날 오전 -
      
	  $('#pran2_2').click(function(){
         insertcnt($('#date2').text(),'2','ski_morning');         
      }); // 셋째날 오전 +
      
	  $('#mran4_2').click(function(){
         insertcnt($('#date2').text(),'1','ski_night');
      }); // 셋째날 야간 -
      
	  $('#pran4_2').click(function(){
         insertcnt($('#date2').text(),'2','ski_night');         
      }); // 셋째날 야간 +
      
	  $('#mran8_2').click(function(){
         insertcnt($('#date2').text(),'1','ski_day');
      }); // 셋째날 종일 -
      
	  $('#pran8_2').click(function(){
         insertcnt($('#date2').text(),'2','ski_day');         
      }); // 셋째날 종일 +
   }
   
   $('#resetbt').click(function(){
		//modcount();
		firstcheck = 0;
		$('#date1').text($('#reset_ski_date1').val());
		$('#skidate2').css('display','none');
		$('#skidate3').css('display','none');
		$('#skidateval0').val('1');
		$('#skidateval1').val('0');
		$('#skidateval2').val('0');
		$('#ski_date_0').text($('#reset_ski_date1').val());
		$('#ski2_0').text($('#reset_ski2_cnt0').val());
		$('#ski4_0').text($('#reset_ski4_cnt0').val());
		$('#ski8_0').text($('#reset_ski8_cnt0').val());
		$('#multipick').datepicker('option','beforeShowDay',firstgo);
		if($('#datecnt').val() > 1){
			$('#skidate2').css('display','');
			$('#date2').text($('#reset_ski_date2').val());
			$('#skidateval1').val('1');
			$('#ski_date_1').text($('#reset_ski_date2').val());
			$('#ski2_1').text($('#reset_ski2_cnt1').val());
			$('#ski4_1').text($('#reset_ski4_cnt1').val());
			$('#ski8_1').text($('#reset_ski8_cnt1').val());
			if($('#datecnt').val() >2){
				$('#ski_date_2').text($('#reset_ski_date3').val());
				$('#date2').text($('#reset_ski_date2').val());
				$('#skidate3').css('display','');
				$('#skidateval2').val('1');
				$('#ski2_2').text($('#reset_ski2_cnt2').val());
				$('#ski4_2').text($('#reset_ski4_cnt2').val());
				$('#ski8_2').text($('#reset_ski8_cnt2').val());
			}
		}		
		$('#name').val($('#reset_name').val());
		$('#tel').val($('#reset_tel').val());
		$('#carnum').val($('#reset_carnum').val());
		$('#nametd').text($('#reset_name').val());
		$('#teltd').text($('#reset_tel').val());
		$('#carnumtd').text($('#reset_carnum').val());
		
	});
   
});   //ready

function finalcheck(){
	var cnt1 = parseInt($('#cnt2_0').val())+parseInt($('#cnt4_0').val())+parseInt($('#cnt8_0').val());
    var cnt2 = parseInt($('#cnt2_1').val())+parseInt($('#cnt4_1').val())+parseInt($('#cnt8_1').val());
    var cnt3 = parseInt($('#cnt2_2').val())+parseInt($('#cnt4_2').val())+parseInt($('#cnt8_2').val());
    var skistr = '';
    var skicnt = '';
    for(var i=0; i<3; i++){
    	//alert($('#skidateval'+i).val());
    	if($('#skidateval'+i).val() == 1){
    		skistr += $('#date'+i).text()+",";
    		skicnt += $('#cnt2_'+i).val()+","+$('#cnt4_'+i).val()+","+$('#cnt8_'+i).val()+",";
    	}
    }
    alert(skistr+"/"+skicnt);
    $('#ski_date').val(skistr);
    $('#ski_count').val(skicnt);
    $('#ski_price').val($('#skipricebox').text());
    var c = 1;
    if($('#skidateval1').val() == 1){
    	c = 2;
    	if($('#skidateval2').val() == 1){
    		c=3
    	}
    }
    //alert("c: "+c);
    $('#finalcnt').val(c);
   // alert($('#finalcnt').val());
    var delresult = deletecount();
	   if(delresult == 'fail'){
		   alert('삭제 실패');
		   return false;
	   }
    if($('#skidateval0').val() == '1'){
	   	if(cnt1 < 1){
	   		alert($('#date1').text()+'일에 스키권 1개 이상 선택해주세여1');
	        return false;
	   	}	   	
    }
    if($('#skidateval1').val() == '1'){
	   	if(cnt2 < 1){
	   		alert($('#date2').text()+'일에 스키권 1개 이상 선택해주세여2');
	        return false;
	   	}	   	
    }
    if($('#skidateval2').val() == '1'){
	   	if(cnt3 < 1){
	   		alert($('#date3').text()+'일에 스키권 1개 이상 선택해주세여3');
	        return false;
	   	}	   	
    }	
	if($('#name').val() == '') {
		   alert('이름을 입력하시라');
		   return false;
	   }
	   if($('#tel').val() == '') {
		   alert('전화번호를 입력하시라');
		   return false;
	   }
}//finalcheck

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

function getdate(){
   $.ajax(
      {
         url : 'selectSkidate.do',
         dataType : 'xml',
         success : function(data){
            $('#result').text('getdate 성공');
            var code = $(data).find('code').text();
            if(code == "success"){
               var dates = eval("("+$(data).find('dates').text()+")");
               arrdate = new Array();
               $(dates.ski).each(function(index,item){
                  var d = item.ski_date.split(' ');
                  arrdate.push(d[0]);            
               }); // 오전오후종일권 다 찬 날짜는 아예 막기
               $('#multipick').datepicker('option','beforeShowDay', go);   
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

function firstgo(date) { 
   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
   for (i = 0; i < firstarr.length; i++) { 
       if($.inArray(y + '-' +(m+1) + '-' + d,firstarr) != -1)  return [true];         
   } 
   return [false]; 
}

function go(date){
   if(arrdate.indexOf($.datepicker.formatDate('yy-mm-dd', date)) != -1) 
      return [false, "arrdate", "블록"];       
    else return [true, "", ""];
} 

function gogo(date) { 
   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
   for (i = 0; i < aaa.length; i++) { 
       if($.inArray(y + '-' +(m+1) + '-' + d,aaa) != -1)  return [true];         
   } 
   return [false]; 
}

function gogogo(date){
   return [true];
}

function getcount(){
   for(var i=0; i<3; i++){
	   if($('#skidateval'+i).val() == 1){
		   ajaxcount($('#date'+i).text(),i);
	   }
   } 
}// getcount

 function ajaxcount(day,i){
	 var str = day.split('-');
     if(str[2].length == 1) str[2] = '0'+str[2];
     if(str[1].length == 1) str[1] = '0'+str[1];
     var d = str[0]+str[1]+str[2];
	 $.ajax(
	    {
        url : 'selectSkiCount.do',
        dataType : 'xml',
        data : {
           ski_date : d
        },
        success : function(data){
           var dates = eval("("+$(data).find('dates').text()+")");
           var code = $(data).find('code').text();
           if(code == 'success'){
              if(Number(dates.ski_morning) > 3){
                       $('#mran2_'+i).attr('disabled', true);
                       $('#pran2_'+i).attr('disabled', true);
                    }
               if(Number(dates.ski_night) > 3){
                       $('#mran4_'+i).attr('disabled', true);
                       $('#pran4_'+i).attr('disabled', true);
                    }
                    if(Number(dates.ski_day) > 3){
                       $('#mran8_'+i).attr('disabled', true);
                       $('#pran8_'+i).attr('disabled', true);
                    }                   
                    $('#result2').text('getcount code 성공!!');
           }else{
              $('#result2').text('getcount code 실패');
           }
                               
           $('#result').text('getcount 성공');
        },
        error : function(e){
           $('#result').html('getcount 실패'+e);
        }
     }      
  );//ajax
 }

function insertcnt(day,check,time){         
    var str = day.split('-');
   if(str[2].length == 1) str[2] = '0'+str[2];
   if(str[1].length == 1) str[1] = '0'+str[1];
   var d = str[0]+str[1]+str[2];   
   $.ajax({
      url : 'insertSkiCount.do',
      dataType : 'xml',
      data : {
         ski_check : check,
         ski_time : time,
         ski_date : d
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
}// insertcount 중간디비 넣기

function modcount(day,ski2,ski4,ski8){
      
   var str = day.split('-');
   if(str[2].length == 1) str[2] = '0'+str[2];
   if(str[1].length == 1) str[1] = '0'+str[1];
   var d = str[0]+str[1]+str[2];
   //alert("modcount 접속 : "+d+"/"+ski2+ski4+ski8);      
   $.ajax(
      {
         url : 'modifySkiCount.do',
         dataType : 'xml',
         data : {
            ski_date : d,
            ski_morning : parseInt(ski2),
            ski_night : parseInt(ski4),
            ski_day : parseInt(ski8)
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
} // modcount 중간디비 빼기

function deletecount(){
	//alert($('#datecnt').val());
	for(var i=0; i<$('#datecnt').val(); i++){	
		
		var ski2 = $('#reset_ski2_cnt'+i).val();
		var ski4 = $('#reset_ski4_cnt'+i).val();
		var ski8 = $('#reset_ski8_cnt'+i).val();
		++i;
		//alert(room_2+"/"+room_4+"/"+room_8);
		var day = $('#reset_ski_date'+i).val().substring(8,18);
    	if(day.length < 5) day = $('#reset_ski_date'+i).val();
		
		//alert(day);
		var str = day.split('-');
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];
		//alert(room_2+"/"+room_4+"/"+room_8+"/"+d);
						
		$.ajax(
	      {
	         url : 'modifySkiCount.do',
	         dataType : 'xml',
	         data : {
	            ski_date : d,
	            ski_morning : parseInt(ski2),
	            ski_night : parseInt(ski4),
	            ski_day : parseInt(ski8)
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
	}
}//마지막 변경 눌렀을 때 최초결제했던 객실 수 modify해주기

function name_keyup(){
	$('#nametd').text($('#name').val());
}

function tel_keyup(){
	$('#teltd').text($('#tel').val());
}

function carnum_keyup(){
	$('#carnumtd').text($('#carnum').val());
}
