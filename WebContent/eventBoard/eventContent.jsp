<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader2.jsp"%>

<style>
.img {
	max-width : 100%;
	height : auto;
}
.span3{
    		width:100%;
    		align:center;
    	}
    	.well{
    		width:100%;
    		height:auto;
    		align:center;
    	}
    	.text-right{
    		align:right;
    	}
    	.btn .btn-large{
    		align:center;
    	}
    	.icon-ok{
    		align:center;
    	}
</style>

 <div class="span3">
  	<div class="well">
  		<h2 class="text-info" align="center">${eventDto.subject}</h2>
  		<hr>
  			<div class="text-center"><img src="${project}event/${eventDto.image}" class="img"></div>
  		<hr>
    	<div class="text-center">
    		<p><a class="btn btn-large" href="eventList.do?pageNum=${pageNum}"><i class="icon-ok"></i> 뒤로가기 </a></p>
    	</div>
  	</div>
</div>