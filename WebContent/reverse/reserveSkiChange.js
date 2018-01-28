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
   
    setInterval("getcount()",1000); //선택한 날짜별로 스키권 남은 개수 알려준다
	
    var fmtarr = $('#fmtdate1').text().trim().split('-');
	if(fmtarr[1].charAt(0) == '0') fmtarr[1] = fmtarr[1].charAt(1);
	if(fmtarr[2].charAt(0) == '0') fmtarr[2] = fmtarr[2].charAt(1);	
	var fmtdate_first = fmtarr[0]+"-"+fmtarr[1]+"-"+fmtarr[2];
	fmtdate = fmtdate_first.trim();
	//alert(fmtdate);
	
	$('#reset_ski_date1').val(fmtdate);
	$('#date0').text(fmtdate);
	$('#ski_date_0').text(fmtdate);
	 $('#multipick').datepicker('option','beforeShowDay', gogogo);
	if($('#datecnt').val() > 1){
		fmtarr = $('#fmtdate2').text().split('-');
		if(fmtarr[1].charAt(0) == '0') fmtarr[1] = fmtarr[1].charAt(1);
		if(fmtarr[2].charAt(0) == '0') fmtarr[2] = fmtarr[2].charAt(1);	
		fmtdate_first = fmtarr[0]+"-"+fmtarr[1]+"-"+fmtarr[2];
		fmtdate = fmtdate_first.trim();
		$('#date1').text(fmtdate);
		$('#reset_ski_date2').val(fmtdate);
		$('#ski_date_1').text(fmtdate);
		//alert(fmtdate);
	}
	
	if($('#datecnt').val() > 2){
		fmtarr = $('#fmtdate3').text().split('-');
		if(fmtarr[1].charAt(0) == '0') fmtarr[1] = fmtarr[1].charAt(1);
		if(fmtarr[2].charAt(0) == '0') fmtarr[2] = fmtarr[2].charAt(1);	
		fmtdate_first = fmtarr[0]+"-"+fmtarr[1]+"-"+fmtarr[2];
		fmtdate = fmtdate_first.trim();
		$('#date2').text(fmtdate);
		$('#reset_ski_date3').val(fmtdate);
		$('#ski_date_2').text(fmtdate);
		 $('#multipick').datepicker('option','beforeShowDay', firstgo);
		 //alert(fmtdate);
	}
	
	
   for(var i=0; i<3; i++){
	   $('#skidate'+i).css('display','none');
	   $('#skiski_'+i).css('display','none');
   } // step2 우선 다 막아놓기
   
   for(var i=0; i<$('#datecnt').val(); i++){
	  $('#skidate'+i).css('display','');
	  $('#skiski_'+i).css('display','');
	  $('#skidateval'+i).val('1');
	  
      var firstdate = $('#date'+i).text().trim();      
      firstarr.push(firstdate);
      $('<div class="alt" id="alt_'+ firstdate +'">'+firstdate+'</div>').appendTo('#a');
      $('#date'+i).text(firstdate);
     // alert(firstdate);
   } // 예약날짜 수를 받아와서 그만큼 step1, 2에 채워넣어준다
   
   //insertcount();
   //modcount();
   /*alert($('#skidateval0').val()+"/"+$('#skidateval1').val()+"/"+$('#skidateval2').val());*/
/////// 달력
   $('#multipick').multiDatesPicker({
      maxPicks: 3,
      minDate: 0,
      maxDate: 100,
      //beforeShowDay: firstgo,
      onSelect : function(){   
         setTimeout("getdate()",1000);
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
            //alert(it);
            //if(it.length > 10) it = it.substring(0,9);
            if(it.length == 17) it = it.substring(8,18);
            if(it.length == 18) it = it.substring(9,19);
            //if(it.length == 16) it = it.substring(9,18);
            //alert(it +"/" + fullDate);
            
            if(it == fullDate){
               ch = 1;
               $(item).remove();	//step1 달력에서 고른 날짜랑 비교해서 같으면 지워준다   
               removecnt = 1;
            }else {
               ++cnt;
            }
            ++cc;
         });
         
         if(removecnt == 1){
        	 //지워주고 나면 step2 에서도 지워줄 값 넣는다
        	 for(var i=0; i<3; i++){
        		 var oday = fulldate(new Date(strMindate($('#date'+i).text())));
                 if(oday == fullDate){
                    var cnt2=$('#cnt2_'+i).val();
                    var cnt4=$('#cnt4_'+i).val();
                    var cnt8=$('#cnt8_'+i).val();
                    $('#multipick').datepicker('option','beforeShowDay', gogogo);
                    modcount(oday,cnt2,cnt4,cnt8);	//얘는 db가서 값 수정해주려고
                    removedate(oday,i);
                 }
        	 }
         }
         
         if(getdateresult == 1){
        	 //getdate에서 막아줄 값이 없을 경우
            $('#multipick').datepicker('option','beforeShowDay', gogogo);               
         }
         
         if(ch == 0){
        	 //선택값이 remove되지 않는 값이면 div만들어서 step1과 step2, table에 붙여준다.
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
					$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').prependTo('#a');
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
               
               $('#multipick').datepicker('option','maxPicks', '3');
               $('#multipick').datepicker('option','beforeShowDay', gogo);
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
   }); //multiDatesPicker   
      
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
   
// + - 누를 시 각 날짜랑 +값인지, 오전권인지 야간권인지 종일권인지 직접 보내서 값 modify 해준다.
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
	  // alert('들어와땅');
	   $('.alt').each(function(i,t){
		   $(t).remove();
	   });
	   for(var i=0; i<3; i++){
		   $('#skidate'+i).css('display','none');
		   $('#skiski_'+i).css('display','none');
	   } // step2 우선 다 막아놓기
	   
	   for(var i=0; i<$('#datecnt').val(); i++){
		  $('#skidate'+i).css('display','');
		  $('#skiski_'+i).css('display','');
		  $('#skidateval'+i).val('1');
		 
	     // var firstdate = $('#date'+i).text();    
	     // alert(firstdate);
	      //firstarr.push(firstdate);
	      $('<div class="alt" id="alt_'+ firstarr[i] +'">'+firstarr[i]+'</div>').appendTo('#a');
	      //$('#date'+i).text(firstdate);
	      $('#skidateval'+i).val('1');
	      $('#ski2_'+i).text($('#reset_ski2_cnt'+i).val());
	      $('#cnt2_'+i).val($('#reset_ski2_cnt'+i).val());
	      $('#ski_date_'+i).text(firstarr[i]);
	   } // 예약날짜 수를 받아와서 그만큼 step1, 2에 채워넣어준다
		firstcheck = 0;
		//$('#date1').text($('#reset_ski_date1').val());
		$('#skidate2').css('display','none');
		$('#skidate3').css('display','none');
		
		//$('#ski4_0').text($('#reset_ski4_cnt0').val());
		//$('#ski8_0').text($('#reset_ski8_cnt0').val());
		if($('#datecnt').val() > 2) $('#multipick').datepicker('option','beforeShowDay',firstgo);
		else $('#multipick').datepicker('option','beforeShowDay',gogogo);
		
		$('#skipricebox').text($('#reset_ski_price').val());	
		$('#name').val($('#reset_name').val());
		$('#tel').val($('#reset_tel').val());
		$('#carnum').val($('#reset_carnum').val());
		$('#nametd').text($('#reset_name').val());
		$('#teltd').text($('#reset_tel').val());
		$('#carnumtd').text($('#reset_carnum').val());		
	}); //리셋버튼   
   
   $('#back').click(function(){
	   //alert('들어왔다');
	   insertcount();
	   modcount();
	  window.close();
   });
});   //ready

function finalcheck(){
	var cnt1 = parseInt($('#cnt2_0').val())+parseInt($('#cnt4_0').val())+parseInt($('#cnt8_0').val());
    var cnt2 = parseInt($('#cnt2_1').val())+parseInt($('#cnt4_1').val())+parseInt($('#cnt8_1').val());
    var cnt3 = parseInt($('#cnt2_2').val())+parseInt($('#cnt4_2').val())+parseInt($('#cnt8_2').val());
    var skistr = '';
    var skicnt = '';
    for(var i=0; i<3; i++){
    	if($('#skidateval'+i).val() == 1){
    		skistr += $('#date'+i).text()+",";
    		skicnt += $('#cnt2_'+i).val()+","+$('#cnt4_'+i).val()+","+$('#cnt8_'+i).val()+",";
    	}
    }
   /* alert(skistr+"/"+skicnt);*/
    $('#ski_date').val(skistr);
    $('#ski_count').val(skicnt);
    $('#ski_price').val($('#skipricebox').text());
    var c = 0;
    //if($('#skidateval1').val() == 1) ++c;
    //if($('#skidateval2').val() == 1) ++c;   
    for(var i=0; i<3; i++){
    	if($('#skidateval'+i).val() == 1) ++c;
    }
    $('#finalcnt').val(c);
   // alert( $('#finalcnt').val());
   // return false;
    //var delresult = deletecount();
    //if(delresult == 'fail'){
	 //  alert('삭제 실패');
	 //  return false;
    //}
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
   $.ajax({
         url : 'selectSkidate.do',
         dataType : 'xml',
         success : function(data){
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
    });//ajax
}// getdate

function firstgo(date) { 
   var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
   for (i = 0; i < firstarr.length; i++) { 
       if($.inArray(y + '-' +(m+1) + '-' + d,firstarr) != -1)  return [true];         
   } 
   return [false]; 
} //처음 켰을 때 예약했던 날짜만 풀림

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
} //전부다 풀림

function getcount(){
   for(var i=0; i<3; i++){
	   if($('#skidateval'+i).val() == 1){
		   ajaxcount($('#date'+i).text(),i);
	   }
   } 
}// getcount 호출

function ajaxcount(day,i){
	var str = day.split('-');
	if(str[2].length == 1) str[2] = '0'+str[2];
	if(str[1].length == 1) str[1] = '0'+str[1];
	var d = str[0]+str[1]+str[2];
	$.ajax({
		url : 'selectSkiCount.do',
		dataType : 'xml',
		data : 
			{
				ski_date : d
			},
		success : function(data){
			var dates = eval("("+$(data).find('dates').text()+")");
			var code = $(data).find('code').text();
			if(code == 'success'){
				if(Number(dates.ski_morning) > 3){
                    $('#mran2_'+i).attr('disabled', true);
                    $('#pran2_'+i).attr('disabled', true);
                    if($('#cnt2_'+i).val() > 0){
                    	$('#mran2_'+i).attr('disabled', false);
					}
                  
                }else{
                	 $('#mran2_'+i).attr('disabled', false);
                     $('#pran2_'+i).attr('disabled', false);
                }
				 if(Number(dates.ski_night) > 3){
                    $('#mran4_'+i).attr('disabled', true);
                    $('#pran4_'+i).attr('disabled', true);
                    if($('#cnt4_'+i).val() > 0){
                    	$('#mran4_'+i).attr('disabled', false);
					}
                 }else{
                	 $('#mran4_'+i).attr('disabled', false);
                     $('#pran4_'+i).attr('disabled', false);
                }
                 if(Number(dates.ski_day) > 3){
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
				$('#result2').text('getcount code 실패');
			}                       
			$('#result').text('getcount 성공');
		},
		error : function(e){
			$('#result').html('getcount 실패'+e);
		}
	});//ajax
}// getcount에서 값을 직접 들고 와서 하나씩 점검해준다.

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
}// + - 누를 시 실시간으로 중간디비 넣기

function modcount(day,ski2,ski4,ski8){
   var str = day.split('-');
   if(str[2].length == 1) str[2] = '0'+str[2];
   if(str[1].length == 1) str[1] = '0'+str[1];
   var d = str[0]+str[1]+str[2];     
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
} // remove할 때 값 modify해주기

function deletecount(){
	for(var i=0; i<$('#datecnt').val(); i++){			
		var ski2 = $('#reset_ski2_cnt'+i).val();
		var ski4 = $('#reset_ski4_cnt'+i).val();
		var ski8 = $('#reset_ski8_cnt'+i).val();
		++i;
		var day = $('#reset_ski_date'+i).val().substring(8,18);
    	if(day.length < 5) day = $('#reset_ski_date'+i).val();
		var str = day.split('-');
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];
						
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

function removedate(day,num){
   for(var i=0; i<3; i++){
      var full = fulldate(new Date(strMindate($('#date'+i).text())));
      if(day == full){
         $('#cnt2_'+i).val('0');
         $('#cnt4_'+i).val('0');
         $('#cnt8_'+i).val('0');
         $('#date'+i).text('');
         $('#skidateval'+i).val('0');
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
}//같은 날짜를 클릭했을 시 step1과 step2에서 지워준다.

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
}//새로 선택한 날짜를 step2와 table에도 띄어준다.  

function cnttable(){
   for(var i=0; i<3; i++){
	   $('#ski2_'+i).text($('#cnt2_'+i).val());
	   $('#ski4_'+i).text($('#cnt4_'+i).val());
	   $('#ski8_'+i).text($('#cnt8_'+i).val());
   }
}//table에 실시간 연동

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
             +  parseInt(c4)*30000
             +  parseInt(c8)*40000;                 
    });
    $('#skipricebox').text(price); 
}// pricebox에 넣어줄 값

function name_keyup(){
	$('#nametd').text($('#name').val());
}//이름 onkeyup으로 테이블 연동

function tel_keyup(){
	$('#teltd').text($('#tel').val());
}//전화번호 onkeyup으로 테이블 연동

function carnum_keyup(){
	$('#carnumtd').text($('#carnum').val());
}//차량번호 onkeyup으로 테이블 연동


function modcount(){
	//alert('mod');
	for(var i=0; i<3; i++){
		if($('#skidateval'+i).val()==1){
			var str = $('#date'+i).text().split('-');
			if(str[2].length == 1) str[2] = '0'+str[2];
			if(str[1].length == 1) str[1] = '0'+str[1];
			var d = str[0]+str[1]+str[2];
			var ski_0 = $('#cnt2_'+i).val();
			var ski_1 = $('#cnt4_'+i).val();
			var ski_2 = $('#cnt8_'+i).val();
					
			$.ajax(
				{
					url : 'modifySkiCount.do',
					dataType : 'xml',
					data : {
						ski_date : d,
						ski_morning : parseInt(ski_0),
						ski_night : parseInt(ski_1),
						ski_day : parseInt(ski_2)
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
			});//ajax
		} //if
	} //for	
} // modcount 중간디비 빼기


function insertcount(){
	//alert('insert');
	for(var i=0; i<$('#datecnt').val(); i++){			
		var ski2 = $('#reset_ski2_cnt'+i).val();
		var ski4 = $('#reset_ski4_cnt'+i).val();
		var ski8 = $('#reset_ski8_cnt'+i).val();
		var day = $('#reset_ski_date'+(i+1)).val();
		//if(day == null || day == '' || day == 'undefined') return;
		var str = day.split('-');
		
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];
		
		$.ajax(
	      {
	         url : '/SKI_Final/reverse/insertSkiChangeCount.jsp',
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
}






