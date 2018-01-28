/**
 * 
 */
	
	var aaa = null;
	var arrdate = null;
	var setdate = 0;
	var setcount = 0;
	var getdateresult = 0;
$(function(){
	/*
	window.addEventListener("beforeunload", function (e) {
		var confirmationMessage = "\o/";	
		(e || window.event).returnValue = confirmationMessage; //Gecko + IE			
			return confirmationMessage; //Webkit, Safari, Chrome
			modcount();
	});
	*/
/*///////////////////////////////////////
 * 		document.ready
/*///////////////////////////////////////	
	$('#bt1').css('display','none');
	$('#resetbt').css('display','none');
	$('#paybt').css('display','none');
	$('#box2').css('display','none');
	$('#box3').css('display','none');
	$('#paybt').css('display','none');
	$('#multipick').datepicker('option', 'disabled', false);	
	//setdate = setInterval("getdate()",1000);
	setTimeout("getdate()",1000);
	
/*///////////////////////////////////////
 * 		달력 클릭시
/*///////////////////////////////////////
	function strMindate(date){
		   var str = date.split('-');
		   var day = new Date(str[0],str[1]-1,str[2]);   
		   return day;
		}//String to Date
	$('#multipick').multiDatesPicker({
		maxPicks: 3,
		minDate: 0,
		maxDate: 100,	
		onSelect : function(){					
			var date1 = $("#multipick").datepicker('getDate');
			var fullDate = fulldate(date1);	               	                    
			var cnt = 0;
			var ch = 0;
			var c = 0;
			var cc = 0;
			var ccc = 0;
			$('.alt').each(function(i,item){	
				if($(item).text() == fullDate){
					ch = 1;
					$(item).remove();	
					//aleret('dd');
					//alert(getdateresult);
					if(getdateresult == 0){
						$('#multipick').datepicker('option','beforeShowDay', go);
					}else{
						$('#multipick').datepicker('option','beforeShowDay', gogogo);
					}
				}else {
					++cnt;
				}
				++cc;
			});
			
			if(getdateresult == 1){
				//alert(cc);
				if(2 > cc) $('#multipick').datepicker('option','beforeShowDay', gogogo);				
			}else{
				if(ch == 1) setTimeout("getdate()",500);
			}
			
			if(cnt > -1) {		
				$('#bt1').css('display','');			
			}else if(cnt < 0){
				$('#bt1').css('display','none');
			}
			
			if(ch == 0){
				var count = 0;
				$('.alt').each(function(i,t){
					++count;
				});
				if(count == 0){
					$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('#a');
				}else if(count == 1){
					var alt = strMindate($('.alt:first').text());
					var sel = strMindate(fullDate);
					if(alt < sel){
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').appendTo('#a');
					}else{
						$('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').prependTo('#a');
					}
				}else if(count >= 2){										
					clearInterval(setdate);					
					var alt1 = strMindate($('.alt:first').text());
					var alt2 = strMindate($('.alt:eq(1)').text());
					var sel = strMindate(fullDate);
					
					//alert(alt1 +"/"+ alt2 +"/"+sel);					
					
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
	                   $('<div class="alt" id="alt_'+ fullDate +'">'+fullDate+'</div>').insertAfter('.alt:first');
	               }
				}
			}			
		}
	});	//multiDatesPicker	
	
/*///////////////////////////////////////
 * 		+ - 클릭시
/*///////////////////////////////////////	
	
	$(document).on('click','.ran',function(e){
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
	}); // skicount
	
	$(document).on('click','#mran2_0',function(e){
		insertcnt($('#date0').text(),'1','ski_morning');		
	}); // 첫날 오전 -
	
	$(document).on('click','#pran2_0',function(e){
		insertcnt($('#date0').text(),'2','ski_morning');		
	}); // 첫날 오전 +
	
	$(document).on('click','#mran4_0',function(e){
		insertcnt($('#date0').text(),'1','ski_night');		
	}); // 첫날 야간 -
	
	$(document).on('click','#pran4_0',function(e){
		insertcnt($('#date0').text(),'2','ski_night');		
	}); // 첫날 야간 +
	
	$(document).on('click','#mran8_0',function(e){
		insertcnt($('#date0').text(),'1','ski_day');
	}); // 첫날 종일 -
	
	$(document).on('click','#pran8_0',function(e){
		insertcnt($('#date0').text(),'2','ski_day');		
	}); // 첫날 종일 +
	
	if($('#date1')){
		$(document).on('click','#mran2_1',function(e){
			insertcnt($('#date1').text(),'1','ski_morning');
		}); // 둘째날 오전 -
		
		$(document).on('click','#pran2_1',function(e){
			insertcnt($('#date1').text(),'2','ski_morning');			
		}); // 둘째날 오전 +
		
		$(document).on('click','#mran4_1',function(e){
			insertcnt($('#date1').text(),'1','ski_night');
		}); // 둘째날 야간 -
		
		$(document).on('click','#pran4_1',function(e){
			insertcnt($('#date1').text(),'2','ski_night');			
		}); // 둘째날 야간 +
		
		$(document).on('click','#mran8_1',function(e){
			insertcnt($('#date1').text(),'1','ski_day');
		}); // 둘째날 종일 -
		
		$(document).on('click','#pran8_1',function(e){
			insertcnt($('#date1').text(),'2','ski_day');			
		}); // 둘째날 종일 +
	}
	
	if($('#date2')){
		$(document).on('click','#mran2_2',function(e){
			insertcnt($('#date2').text(),'1','ski_morning');			
		}); // 셋째날 오전 -
		
		$(document).on('click','#pran2_2',function(e){
			insertcnt($('#date2').text(),'2','ski_morning');			
		}); // 셋째날 오전 +
		
		$(document).on('click','#mran4_2',function(e){
			insertcnt($('#date2').text(),'1','ski_night');
		}); // 셋째날 야간 -
		
		$(document).on('click','#pran4_2',function(e){
			insertcnt($('#date2').text(),'2','ski_night');			
		}); // 셋째날 야간 +
		
		$(document).on('click','#mran8_2',function(e){
			insertcnt($('#date2').text(),'1','ski_day');
		}); // 셋째날 종일 -
		
		$(document).on('click','#pran8_2',function(e){
			insertcnt($('#date2').text(),'2','ski_day');			
		}); // 셋째날 종일 +
	}
	
/*///////////////////////////////////////
 * 		'다음', '이전으로' 클릭시
/*///////////////////////////////////////	
	
	$('#bt1').click(function(){	
		$('.alt').each(function(i,t){
			var tstr = $(t).text();
			if(tstr.length > 15) {
				//alert(tstr.length);
				var tcheck = tstr.split('-');
				//alert(tcheck[2].length);
				if(tcheck[2].length >= 6){
					tcheck[2] = tcheck[2].substring(0,2);
				}else{
				    tcheck[2] = tcheck[2].substring(0,1);	
				}
				tstr = tcheck[0]+"-"+tcheck[1]+"-"+tcheck[2];
			}
			
			$('<tr class="altdate">'
             +'   <th>날짜 </th>'
             +'   <td>'+tstr+'</td>'
             +'</tr>'
            ).appendTo('#ta');
		
			$('<div class="skidate" id="skidate_"'+i+'>'
	          +'	<div class="date" id="date'+i+'">'+tstr+'</div>'
	          +'	<div class="__count_range" > 오전권 (20,000) &nbsp;&nbsp;'
	          +'		<input class="ran" id="mran2_'+i+'" type="button" value="-" count_range="m">'
	          +'		<input class="count" id="cnt2_'+i+'" value="0" readonly name="">'
	          +'		<input class="ran" id="pran2_'+i+'" type="button" value="+" count_range="p">'        
	          +'	</div>'      
	          +'	<div class="__count_range" id="ran4_'+i+'">야간권 (30,000)&nbsp;&nbsp;&nbsp;'            	
	          +'		<input class="ran" id="mran4_'+i+'" value="-" count_range="m" type="button">'        
	          +'		<input class="count" id="cnt4_'+i+'" value="0" readonly name="">'        
	          +'		<input class="ran" id="pran4_'+i+'" value="+" count_range="p" type="button">'        
	          +'	</div>'      
	          +'	<div class="__count_range" id="ran8_'+i+'">종일권 (40,000)&nbsp;&nbsp;&nbsp;'      
	          +'		<input class="ran" id="mran8_'+i+'" value="-" count_range="m" type="button">'       		
	          +'		<input class="count" id="cnt8_'+i+'" value="0" readonly name="">'       
	          +'		<input class="ran" id="pran8_'+i+'" value="+" count_range="p" type="button">'        
	          +'	</div>'        
	          +'</div>'  
			).appendTo('#skicntbox');
		});		
		$('#bt1').css('display','none');
		$('#box2').css('display','');
		$('#multipick').datepicker('option', 'disabled', true);		
		$('.ran').each(function(i,t){
			$(t).attr('disabled', false);
		});
		//clearInterval(setdate);
		setcount = setInterval("getcount()", 1000);	// + 최대값 걸어주기 
	}); // bt1
	
	$('#bt2').click(function(){
		var ch = 0;		
		$('.date').each(function(i,t){
			var cnt = parseInt($('#cnt2_'+i).val())
					 +parseInt($('#cnt4_'+i).val())
					 +parseInt($('#cnt8_'+i).val());
			if(cnt < 1){
				++ ch;
				alert($('#date'+i).text()+'일에 최소 1개 이상 스키권을 선택해주라');
				return false;
			}		 
		});			
		if(ch == 0){
			$('#bt2').css('display','none');
			$('#backbt1').css('display','none');
			$('#box3').css('display','');
			$('#resetbt').css('display','');
			
			$('.ran').each(function(i,t){
				$(t).attr('disabled',true);
			});			
			var cnt2 = 0;
			var cnt4 = 0;
			var cnt8 = 0;			
			$('.date').each(function(i,t){
				cnt2 += parseInt($('#cnt2_'+i).val());
				cnt4 += parseInt($('#cnt4_'+i).val());
				cnt8 += parseInt($('#cnt8_'+i).val());
			});
			
			$('<tr class="skicnt">'
	        +'	<th>오전권</th> <td>'+cnt2+'</td>'
	        +'</tr>'
	        +'<tr class="skicnt">'
	        +'	<th>야간권</th> <td>'+cnt4+'</td>'
	        +'</tr>'
	        +'<tr class="skicnt">'
	        +'	<th>종일권</th> <td>'+cnt8+'</td>'
	        +'</tr>'
	        +'<tr class="skicnt">'
	        +'	<th>총 가격</th> <td name="price">'+$('#skipricebox').text()+'</td>'
	        +'</tr>').appendTo('#ta');
			clearInterval(setcount);
		}
	}); // bt2
	
	$('#bt3').click(function(){
		if( $('#name').val() == '' ){
	   		alert('이용자 이름을 입력해주세요');
	   		return false;
	   	}else if( $('#tel').val() == '' ){
	   		alert('전화번호를 입력해주세요');
	   		return false;
	   	}else{
	   		$('#paybt').css('display','');
	   		$('#bt3').css('display','none');
	   		$('#backbt2').css('display','none');
	   		var ski_date = '';
			var ski_count = '';
			$('.date').each(function(i,t){
				ski_date += $(t).text()+','; 
			});
			$('.count').each(function(i,t){
				ski_count += $(t).val()+',';
			});
			$('#ski_price').val($('#skipricebox').text());
			$('#ski_date').val(ski_date);
			$('#ski_count').val(ski_count);
			
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
	}); //bt3
		
	$('#backbt1').click(function(){
		modcount();
	   $('.count').val(0);
       $('#multipick').datepicker('option', 'disabled', false);
       $('#box2').css('display','none');
       $('#box3').css('display','none');
       $('#paybt').css('display','none');
       $('#resetbt').css('display','none');
       $('#bt1').css('display','');
   	   $('#ta > tr').remove();
   	   $('.skidate').each(function(i,t){
   		$(t).remove();
   	   });      	   
   	   //setTimeout("getdate()",500);
	}); // backbt1
	
	$('#backbt2').click(function(){
		$('#box3').css('display','none');
		$('.ran').each(function(i,t){
			$(t).attr('disabled', false);
		});
		$('.skicnt').each(function(i,t){
			$(t).remove();
		});
		$('#bt2').css('display','');
		setcount = setInterval("getcount()",1000);
	}); // backbt2
	
	$('#resetbt').click(function(){
		reset();
	});
});	//ready

/*///////////////////////////////////////
 * 		'다시설정' 클릭시
/*///////////////////////////////////////
function reset(){
	modcount();
	$('#bt1').css('display','none');
	$('#bt2').css('display','');
	$('#bt3').css('display','');
	$('#backbt1').css('display','');
	$('#backbt2').css('display','');
    $('#paybt').css('display','none');
    $('#resetbt').css('display','none');
    //$('#backbt').css('display','none');
	$('#box2').css('display','none');
	$('#box3').css('display','none');
	$('#multipick').datepicker('option', 'disabled', false);
	$('#multipick').datepicker('option', 'setDate', '');	
	$('#ta > tr').remove();
	$('#skipricebox').text('');
	$('#name').val('');
	$('#tel').val('');
	$('#carnum').val('');
	$('.skidate').each(function(i,t){
		$(t).remove();
   	}); 
	$('.ran').each(function(i,t){
		t.attr('disabled', false);
	});
	$('.alt').each(function(i,t){
		$(t).remove();
	});
	clearInterval(setcount);	
	setdate = setTimeout("getdate()",1000);
	if(getdateresult == 1){
		$('#multipick').datepicker('option','beforeShowDay', gogogo);	
	}
}//reset

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
	return [true, "", ""];
}

function getcount(){
	$('.date').each(function(i,t) {
		var str = $(t).text().split('-');
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
			}		
		);//ajax
	});//.date	
}// getcount

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

function modcount(){
	if(! $('#date1')) return;
	$('.date').each(function(i,t) {
		var str = $(t).text().split('-');
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
			}		
		);//ajax
	});//.date	
} // modcount 중간디비 빼기

