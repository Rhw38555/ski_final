/**

 * 
 */

var setdate = 0;
var setcount = setInterval("getcount()",300);
var a = null;
var first = 0;

$(document).ready(function(){
	
	setTimeout("getdate()",300);
	setInterval("getcount()",300);
	//setcount;
	//alert();
	
	//var fmtarr = '';
	
	for(var i=0; i<3; i++){
		$('#mran2_'+i).attr('disabled', false);
		$('#mran4_'+i).attr('disabled', false);
		$('#mran8_'+i).attr('disabled', false);
		$('#pran2_'+i).attr('disabled', false);
		$('#pran4_'+i).attr('disabled', false);
		$('#pran8_'+i).attr('disabled', false);
	}
	
	var fmtarr = $('#fmtdate1').text().trim().split('-');
	//alert("날짜"+ $('#fmtdate1').text().trim());
	//alert(fmtarr[1]);
	if(fmtarr[1].charAt(0) == '0') fmtarr[1] = fmtarr[1].charAt(1);
	if(fmtarr[2].charAt(0) == '0') fmtarr[2] = fmtarr[2].charAt(1);	
	var fmtdate = fmtarr[0]+"-"+fmtarr[1]+"-"+fmtarr[2];
	
	$('#reset_room_date1').val(fmtdate);
	$('#date1').text(fmtdate);
	$('#room_date_0').text(fmtdate);
	$('#roomdate2').css('display','none');
	$('#roomdate3').css('display','none');
	$('#roomdateval0').val('1');
	$('#re').text(fmtdate);
	$('#check_in').text(fmtdate);
	
	var outarr = $('#reset_checkout').val().split('-');
	if(outarr[1].charAt(0) == '0') outarr[1] = outarr[1].charAt(1);
	if(outarr[2].charAt(0) == '0') outarr[2] = outarr[2].charAt(1);	
	var outdate = outarr[0]+"-"+outarr[1]+"-"+outarr[2];
	$('#re2').text(outdate);
	$('#check_out').text(outdate);
	
	if($('#datecnt').val() > 1){
		fmtarr = $('#fmtdate2').text().split('-');
		if(fmtarr[1].charAt(0) == '0') fmtarr[1] = fmtarr[1].charAt(1);
		if(fmtarr[2].charAt(0) == '0') fmtarr[2] = fmtarr[2].charAt(1);	
		var fmtdate = fmtarr[0]+"-"+fmtarr[1]+"-"+fmtarr[2];
		$('#date2').text(fmtdate);
		$('#reset_room_date2').val(fmtdate);
		$('#room_date_1').text(fmtdate);
		$('#roomdate2').css('display','');
		$('#roomdateval1').val('1');
		if($('#datecnt').val() >2){
			fmtarr = $('#fmtdate3').text().split('-');
			if(fmtarr[1].charAt(0) == '0') fmtarr[1] = fmtarr[1].charAt(1);
			if(fmtarr[2].charAt(0) == '0') fmtarr[2] = fmtarr[2].charAt(1);	
			var fmtdate = fmtarr[0]+"-"+fmtarr[1]+"-"+fmtarr[2];
			$('#date3').text(fmtdate);
			$('#room_date_2').text(fmtdate);
			$('#reset_room_date3').val(fmtdate);
			$('#roomdate3').css('display','');
			$('#roomdateval2').val('1');
		}
	}
    
    
//// 달력
	var date1 = null;
	var date0 = strMindate($('#roomdate0').val());
	var date11 = strMindate($('#roomdate1').val());	
    $('#datepicker1').datepicker({
        dateFormat: 'yy-mm-dd',
        inline: true,
        minDate : date0,
        maxDate : 100,
        onSelect: function(){ 
        	++first;
        	$('#datepicker1').datepicker('option','minDate','0');
        	var roomorigin = $('#re').text().substring(8,17);
        	if(roomorigin.length < 5) roomorigin = $('#re').text();
        	
            date1 = $("#datepicker1").datepicker('getDate');
            var day1 = $("#datepicker1").datepicker('getDate').getDate();                 
            var month1 = $("#datepicker1").datepicker('getDate').getMonth() + 1;             
            var year1 = $("#datepicker1").datepicker('getDate').getFullYear();
            var fullDate = year1 + "-" + month1 + "-" + day1;            
            var mydate = new Date(date1);    
            var date_date = new Date(date1);    
            $('#re').text(fullDate);     
            
            if( roomorigin != $('#re').text()){
            	var mydatecnt = 0 ;
            	//같은 날짜 선택한게 아닐 시
            	if(first != 1){
            		//alert(first);
            		modcount(); //원래 날짜 카운트는 빼준다.
            	}           	              	
		        if(getdateresult == 0){
		    	    a = new Array();;
			     	var recount = 0;
			     	var rere = 0;	
		     		var mydate_1 = strMindate(year1 + "-" + month1 + "-" + (++ day1));
					var mydate_2 = strMindate(year1 + "-" + month1 + "-" + (++ day1));
					var strmy_1 = fulldate(mydate_1);           		
            		var strmy_2 = fulldate(mydate_2);
            		
			     	for(var i=0; i<arrdate.length; i++){			     		
						var day = strMindate(arrdate[i]);
						var strday = fulldate(day);
						//alert(mydate_1+"/"+mydate_2+"/"+day);
			     		if(strmy_1 == strday){
			     			//alert('mydate_1==day');
			     			mydate.setDate (day.getDate());
			     			rere = 1;
			     		}else if(strmy_2 == strday){
			     			//alert('mydate_2==day');
			     			if(rere == 0){
			     				mydate.setDate (day.getDate());
			     			}
			     		}else{
			     			//alert('안들어와');
			     			++recount;
			     		}
			     	}	     	
			     	if(recount == arrdate.length){
			     		mydate.setDate (mydate.getDate() + 3);
			     	}
				 }else{
				 	mydate.setDate (mydate.getDate() + 3);
				 }
		            	
            	if(date_date >= strMindate($('#re2').text())){
            	//선택한 날짜가 re2 날짜보다 뒤에 있을 경우 roomdate 박스 숨기고 re2는 비워둔다. 
                	$('#re2').text('');
                	$('#roomcntbox').css('display','none');
                	$('#date1').text('');
                	$('#date2').text('');
                	$('#date3').text('');
                	$('#check_in').text('');
        			$('#check_out').text('');
        			$('#roompricebox').text('');
        			for(var i=0; i<3; i++){
        				$('#room_date_'+i).text('');
        				$('#room2_'+i).text('');
        				$('#room4_'+i).text('');
        				$('#room8_'+i).text('');
        				$('#cnt2_'+i).val('0');
        				$('#cnt4_'+i).val('0');
        				$('#cnt8_'+i).val('0');
        			}
                }else{
                	//선택한 날짜가 앞에 있을 경우
                	date_date.setDate(date_date.getDate() + 3);
                	mydatecnt = 1;
                	if(date_date < strMindate($('#re2').text())){
                		//체크인 설정보다 체크아웃 날짜가 3일 이상일 경우
                		$('#re2').text('');
                    	$('#roomcntbox').css('display','none');
                    	$('#date1').text('');
                    	$('#date2').text('');
                    	$('#date3').text('');
                    	$('#check_in').text('');
            			$('#check_out').text('');
            			$('#roompricebox').text('');
            			for(var i=0; i<3; i++){
            				$('#room_date_'+i).text('');
            				$('#room2_'+i).text('');
            				$('#room4_'+i).text('');
            				$('#room8_'+i).text('');
            				$('#cnt2_'+i).val('0');
            				$('#cnt4_'+i).val('0');
            				$('#cnt8_'+i).val('0');
            				$('#roomdateval'+i).val('0');
            				$('#room')
            			}
                	}else{
                		//3일 이내일 경우는 showstep2로 간다.
                		showstep2();
                	}                	
                }           	
                $('#datepicker2').datepicker('option', 'maxDate', mydate);
                $('#datepicker2').datepicker('option', 'minDate', date1);               
            }         
        }
    });// Datepicker1
    
    var date2 = '';
    $('#datepicker2').datepicker({
        dateFormat: 'yy-mm-dd',
        inline: true,
        minDate: date0,
        maxDate: date11,
        onSelect: function(){      	
        	date2 = $("#datepicker2").datepicker('getDate');
        	var day2 = $("#datepicker2").datepicker('getDate').getDate();                
	        var month2  = $("#datepicker2").datepicker('getDate').getMonth() + 1;             
	        var year2 = $("#datepicker2").datepicker('getDate').getFullYear();
	        var fullDate = year2 + "-" + month2 + "-" + day2;            
	        var mydate = new Date(date2);
	        
        	if($('#re').text() == ''){
        		alert('체크인 날짜를 먼저 선택해주세요');
        		return;
        	}else if(strMindate($('#re').text()) == mydate){
        		alert('체크인과 체크아웃 날짜가 같습니다');
         		return;
        	}       	
	        $('#re2').text(fullDate);	        
        	if(strMindate($('#re').text()) < mydate){  
        		modcount();
        		showstep2();
        	}           
        }
    });// Datepicker2

   
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
        setTimeout("getcount()",300);
        price();
    });


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
   
	$('#resetbt').click(function(){
		
		//alert($('#datecnt').val());
		modcount();
		first = 0;
		$('#date1').text($('#reset_room_date1').val());
		$('#roomdate2').css('display','none');
		$('#roomdate3').css('display','none');
		$('#roomdateval0').val('1');
		$('#re').text($('#reset_checkin').val());
		$('#re2').text($('#reset_checkout').val());
		$('#check_in').text($('#reset_checkin').val());
		$('#check_out').text($('#reset_checkout').val());
		$('#room_date_0').text($('#reset_room_date1').val());
		$('#room2_0').text($('#reset_room2_cnt0').val());
		$('#room4_0').text($('#reset_room4_cnt0').val());
		$('#room8_0').text($('#reset_room8_cnt0').val());
		$('#datepicker1').datepicker('option','minDate',date0);
		$('#datepicker2').datepicker('option','minDate',date0);
		$('#datepicker2').datepicker('option','maxDate',date11);
		$('#roompricebox').text($('#reset_room_price').val());
		$('#cnt2_0').val($('#reset_room2_cnt0').val());
		$('#cnt4_0').val($('#reset_room4_cnt0').val());
		$('#cnt8_0').val($('#reset_room8_cnt0').val());
		if($('#datecnt').val() > 1){
			$('#roomdate2').css('display','');
			$('#date2').text($('#reset_room_date2').val());
			$('#roomdateval1').val('1');
			$('#room_date_1').text($('#reset_room_date2').val());
			$('#room2_1').text($('#reset_room2_cnt1').val());
			$('#room4_1').text($('#reset_room4_cnt1').val());
			$('#room8_1').text($('#reset_room8_cnt1').val());
			$('#cnt2_1').val($('#reset_room2_cnt1').val());
			$('#cnt4_1').val($('#reset_room4_cnt1').val());
			$('#cnt8_1').val($('#reset_room8_cnt1').val());
			if($('#datecnt').val() >2){
				$('#roomroom_2').css('display','');
				$('#room_date_2').text($('#reset_room_date3').val());
				$('#date3').text($('#reset_room_date3').val());
				$('#roomdate3').css('display','');
				$('#roomdateval2').val('1');
				$('#room2_2').text($('#reset_room2_cnt2').val());
				$('#room4_2').text($('#reset_room4_cnt2').val());
				$('#room8_2').text($('#reset_room8_cnt2').val());
				$('#cnt2_2').val($('#reset_room2_cnt2').val());
				
				$('#cnt4_2').val($('#reset_room4_cnt2').val());
				$('#cnt8_2').val($('#reset_room8_cnt2').val());
			}
		}
		for(var i=0; i<3; i++){
			$('#mran2_'+i).attr('disabled', false);
			$('#mran4_'+i).attr('disabled', false);
			$('#mran8_'+i).attr('disabled', false);
			$('#pran2_'+i).attr('disabled', false);
			$('#pran4_'+i).attr('disabled', false);
			$('#pran8_'+i).attr('disabled', false);
		}
		
		$('#name').val($('#reset_name').val());
		$('#tel').val($('#reset_tel').val());
		$('#carnum').val($('#reset_carnum').val());
		$('#nametd').text($('#reset_name').val());
		$('#teltd').text($('#reset_tel').val());
		$('#carnumtd').text($('#reset_carnum').val());
		
	});		
	
	 $('#back').click(function(){
		   //insertcount();
		   modcount();
		   window.close();
	 });
});//ready
 
function showstep2(){
	if( $('#re').text() == '' ){
		//alert('re.text 없ㅇ');
		$('#roomcntbox').css('display','none');
		$('#check_in').text('');
		$('#check_out').text('');
		return;
	}else if( $('#re2').text() == '' ){
		//alert('re2.text 없ㅇ');
		$('#roomcntbox').css('display','none');
		$('#check_in').text('');
		$('#check_out').text('');
		return;
	}else{
		$('#roomcntbox').css('display','');		
		$('#roomdate1').css('display','none');
		$('#roomdate2').css('display','none');
		$('#roomdate3').css('display','none');
		$('#roompricebox').text('');
		for(var i=0; i<3; i++){
			$('#roomdateval'+i).val('0');
			$('#roomroom_'+i).css('display','none');
			$('#room_date_'+i).text('');
			$('#room2_'+i).text('0');
			$('#room4_'+i).text('0');
			$('#room8_'+i).text('0');
			$('#cnt2_'+i).val('0');
			$('#cnt4_'+i).val('0');
			$('#cnt8_'+i).val('0');
		}
		var dat1 = strMindate($('#re').text());
		var dat2 = strMindate($('#re2').text());			
		var time = (dat2 - dat1)/(24 * 60 * 60 * 1000);
		//alert(time);
		  
		$('#check_in').text($('#re').text());
		$('#check_out').text($('#re2').text());
		   
		if(time >= 1){
			$('#date1').text($('#re').text());
			$('#room_date_0').text($('#re').text());
			$('#roomdate1').css('display','');
			$('#roomroom_0').css('display','');
			$('#roomdateval0').val('1');
			
			if(time >= 2){					
				//alert('2 들어와');
				var date2 = new Date($('#re').text());
				//alert(date2.getDate());
				date2.setDate (date2.getDate() + 1);
				var day = date2.getDate();                 
				var month = date2.getMonth() + 1;             
				var year = date2.getFullYear();
				if(day.length == 1) day = "0"+day;
				if(month.length == 1) month = "0"+month;
				var datestr = year + "-" + month + "-" + day; 
				//alert(datestr);
				$('#room_date_1').text(datestr);
				$('#date2').text(datestr);
				//alert($('#date2').text());
				$('#roomdate2').css('display','');
				$('#roomroom_1').css('display','');
				$('#roomdateval1').val('1');
				
				if(time >= 3){
					$('#roomdate3').css('display','');
					$('#roomroom_2').css('display','');
					$('#roomdateval2').val('1');
					date2.setDate (date2.getDate() + 1);
					day = date2.getDate();                 
					month = date2.getMonth() + 1;             
					year = date2.getFullYear();
					if(day.length == 1) day = "0"+day;
					if(month.length == 1) month = "0"+month;
					datestr = year + "-" + month + "-" + day; 
					$('#date3').text(datestr);
					$('#room_date_2').text(datestr);
				}
			}
		}
	//setcount = setInterval("getcount()",1000);
	}              
}

function price(){
	//alert($('#cnt2_2').val()+"/"+$('#cnt8_2').val());
	 var price
	 	 =($('#cnt2_0').val()*20000)
		 +($('#cnt2_1').val()*20000)
		 +($('#cnt2_2').val()*20000)
		 +($('#cnt4_0').val()*40000)
		 +($('#cnt4_1').val()*40000)
		 +($('#cnt4_2').val()*40000)
		 +($('#cnt8_0').val()*80000)
		 +($('#cnt8_1').val()*80000)
		 +($('#cnt8_2').val()*80000);  	
	 $('#roompricebox').text(price); 		 
	
	 $('#room2_0').text($('#cnt2_0').val());
	 $('#room4_0').text($('#cnt4_0').val());
	 $('#room8_0').text($('#cnt8_0').val());
	 if($('#datecnt').val() > 1){
		 $('#room2_1').text($('#cnt2_1').val());
		 $('#room4_1').text($('#cnt4_1').val());
		 $('#room8_1').text($('#cnt8_1').val());
		 if($('#datecnt').val() > 2){
			 $('#room2_2').text($('#cnt2_2').val());
			 $('#room4_2').text($('#cnt4_2').val());
			 $('#room8_2').text($('#cnt8_2').val());
		 }
	 }		 
} //price

function finalcheck(){
	var cnt1 = parseInt($('#cnt2_0').val())+parseInt($('#cnt4_0').val())+parseInt($('#cnt8_0').val());
    var cnt2 = parseInt($('#cnt2_1').val())+parseInt($('#cnt4_1').val())+parseInt($('#cnt8_1').val());
    var cnt3 = parseInt($('#cnt2_2').val())+parseInt($('#cnt4_2').val())+parseInt($('#cnt8_2').val());
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
    //alert(roomstr+"/"+roomcnt);
    $('#room_check').val($('#check_in').text()+"/"+$('#check_out').text());
    $('#room_date').val(roomstr);
    $('#room_cnt').val(roomcnt);
    $('#room_price').val($('#roompricebox').text());
    var c = 1;
    if($('#roomdateval1').val() == 1){
    	c = 2;
    	if($('#roomdateval2').val() == 1){
    		c=3
    	}
    }
    $('#finalcnt').val(c);
   // alert($('#finalcnt').val());
    deletecount();
    /*
    var delresult = deletecount();
	   if(delresult == 'fail'){
		   alert('삭제 실패');
		   return false;
	   }
	   */
   if($('#re').text() == ''){
	   alert('체크인 날짜를 선택해주세ㅛㅇ');
	   return false;
   }
   if($('#re2').text() == ''){
	   alert('체크아웃 날짜를 선택해주세ㅛㅇ');
	   return false;
   }  
    if($('#roomdateval0').val() == '1'){
	   	if(cnt1 < 1){
	   		alert($('#date1').text()+'일에 1개 이상 객실을 선택해주세여1');
	        return false;
	   	}	   	
    }
    if($('#roomdateval1').val() == '1'){
	   	if(cnt2 < 1){
	   		alert($('#date2').text()+'일에 1개 이상 객실을 선택해주세여2');
	        return false;
	   	}	   	
    }
    if($('#roomdateval2').val() == '1'){
	   	if(cnt3 < 1){
	   		alert($('#date3').text()+'일에 1개 이상 객실을 선택해주세여3');
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

var aaa = null;
var arrdate = null;
var getdateresult = 0;

function getdate(){
	//
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
					}); 
					$('#datepicker1').datepicker('option','beforeShowDay', go1);
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
		//alert($(t).text());
		
		if($(t).text().trim() == '') return;
		var str = $(t).text().trim().split('-');
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];		
		//alert(d);
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
						//alert(dates.room_2 +"/"+dates.room_4+"/"+dates.room_8);
						if(Number(dates.room_2) > 3){
	                        $('#mran2_'+i).attr('disabled', true);
	                        $('#pran2_'+i).attr('disabled', true);
	                        //alert()
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
	//setTimeout("getdate()",300);
}// getcount

function insertcnt(day,check,time){			
    var str = day.split('-');
	if(str[2].length == 1) str[2] = '0'+str[2];
	if(str[1].length == 1) str[1] = '0'+str[1];
	var d = str[0]+str[1]+str[2];	
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
	setTimeout("getdate()",500);
}//중간디비 넣기
         
function modcount(){
	//alert('들어왔어');
	$('.roomdateval').each(function(i,t) {
		var t = '';
		//alert(i+"번째 :"+$('#roomdateval'+i).val()+"/"+$('#date'+i).text());
		//if($('#roomdateval'+i).val() == '0') {
		//	return;
		//}
		
		//if( $('#date'+(i+1)).text().length > 20){
		//	t =  $('#date'+(i+1)).trim();
		//}else{
			t = $('#date'+(i+1)).text().trim();
		//}
		
		if(t == '' || t == null){
			return;
		}
		//alert(t);
		
		var str = t.split('-');
		//alert(str[2]);
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];
		var room_2 = $('#cnt2_'+i).val();
		var room_4 = $('#cnt4_'+i).val();
		var room_8 = $('#cnt8_'+i).val();
		//alert(d+"/"+room_2+"/"+room_4+"/"+room_8);		
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
	setTimeout("getdate()",500);
} // modcount 중간디비 빼기

function deletecount(){
	//alert($('#datecnt').val());
	for(var i=0; i<$('#datecnt').val(); i++){			
		var room_2 = $('#reset_room2_cnt'+i).val();
		var room_4 = $('#reset_room4_cnt'+i).val();
		var room_8 = $('#reset_room8_cnt'+i).val();
		++i;
		//alert(room_2+"/"+room_4+"/"+room_8);
		var day = $('#reset_room_date'+i).val().substring(8,18);
		//alert($('#reset_room_date'+i).val()+"/"+day);
    	if(day.length < 5) day = $('#reset_room_date'+i).val();
		for(var j=1; j<4; j++){
			//alert(day + "/" +$('#date'+j).text());
			if(day == $('#date'+j).text()){
				room_2 = room_2 - $('#cnt2_'+(j-1).val());
				room_4 = room_4 - $('#cnt4_'+(j-1).val());
				room_8 = room_8 - $('#cnt8_'+(j-1).val());
			}
		}
		//alert(day);
		var str = day.split('-');
		if(str[2].length == 1) str[2] = '0'+str[2];
		if(str[1].length == 1) str[1] = '0'+str[1];
		var d = str[0]+str[1]+str[2];
		//alert(room_2+"/"+room_4+"/"+room_8+"/"+d);
						
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
	}
}//마지막 변경 눌렀을 때 최초결제했던 객실 수 modify해주기

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


function name_keyup(){
	$('#nametd').text($('#name').val());
}

function tel_keyup(){
	$('#teltd').text($('#tel').val());
}

function carnum_keyup(){
	$('#carnumtd').text($('#carnum').val());
}



