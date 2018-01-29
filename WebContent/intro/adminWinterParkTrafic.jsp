<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>
<%@ include file="setting.jsp" %>
<script src="/SKI_Final/intro/jquery-3.2.1.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(function(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			var startMap = roadMapInfo($("#start").val());
			var endMap = roadMapInfo($("#end").val());
			if(endMap == undefined) {
				alert("도착지를 선택해주세요.");
				$('#end').focus();
				return false;
			} else {
				
				var url = "http://map.naver.com/index.nhn?menu=route&mapMode=0";
				url += "&slng="+startMap[0]+"&slat="+startMap[1];
				url += "&elng="+endMap[0]+"&elat="+endMap[1];
				url += "&pathType=0&dtPathType=0";
				url += "&sText="+startMap[2]+"&eText="+endMap[2]+"&enc=b64";
				
				window.open(url, '_naver_map');
			}
		});
	});

	function roadMapInfo(selectMap) {
		// 0: Ing, 1: lat, 2: text
		var roadMapArray = new Array(new Array(20), new Array(3));
		roadMapArray[0] = ["127.0276368", "37.4979502", "6rCV64Ko7JetIDLtmLjshKA%3D"]; //서울 강남역
		roadMapArray[1] = ["127.0502125", "37.1730077", "64%2BZ7IiY7JuQSUM%3D"]; // 수원 I.C
		roadMapArray[2] = ["127.1037670", "37.2899215", "7Iug6rCI67aE6riw7KCQ"]; // 신갈 JCT
		roadMapArray[3] = ["127.4270250", "37.2357846", "7Zi467KV67aE6riw7KCQ"]; // 호법 JCT
		roadMapArray[4] = ["127.1227987", "37.3403601", "6rK96riw64%2BEIOyEseuCqOyLnCDrtoTri7nqtawg6rWs66%2B464%2BZ"]; // 분당 구미동
		roadMapArray[5] = ["127.2923750", "36.5929071", "7IS47KKF7Yq567OE7J6Q7LmY7Iuc7LKt"]; // 충청권
		roadMapArray[6] = ["128.5961949", "35.8764460", "64yA6rWs7JetIOqyveu2gOyEoA%3D%3D"]; // 경상권
		roadMapArray[7] = ["126.9092596", "35.1653716", "6rSR7KO87JetIOq0keyjvOyEoA%3D%3D"]; // 전라권
		roadMapArray[8] = ["127.3469960", "37.2168110", "7KeA7IKw66as7KGw7Yq4"]; // 지산포레스트 리조트 입구
		roadMapArray[9] = ["127.3455493", "37.2183959", "7KeA7IKw7Y%2Bs66CI7Iqk7Yq466as7KGw7Yq466mU7J207ZSM7L2Y64%2BE"]; // 지산포레스트 리조트 메이플콘도
		roadMapArray[10] = ["127.7485524", "34.7525773", "7KeA7IKw7Y%2Bs66CI7Iqk7Yq466as7KGw7Yq4SuyEvO2EsA%3D%3D"]; // 지산포레스트 리조트 J센터
		roadMapArray[11] = ["127.2211875", "37.5171667", "64%2BZ7ISc7Jq47Yao6rKM7J207Yq4"]; // 동서울 TG

		return roadMapArray[selectMap];
	}
	//-->
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="intrototal">
				<h2>교통정보</h2>
				<br><br>
				<table class="trafic">
					<tr>
						<th> 출발지 </th>
						<td class="bg">
							<select name="start" id="start" title="출발지">
								<option value="0">서울 강남</option>
								<option value="11">동서울 TG</option>
								<option value="1">동수원 I.C</option>
								<option value="2">신갈 JCT</option>
								<option value="3">호법 JCT</option>
								<option value="4">분당 구미동</option>
								<option value="5">충청권</option>
								<option value="6">경상권</option>
								<option value="7">전라권</option>
							</select>
						</td>
						<th> 도착지 </th>
						<td>
							<select name="end" id="end" title="도착지">
								<option value="">선택해주세요</option>
								<option value="8">WinterPark 리조트 입구</option>
								<option value="9">WinterPark 리조트 메이플콘도</option>
								<option value="10">WinterPark 리조트 J센터</option>
							</select>
							
							<button id="searchBtn" class="btn btn-primary">검색</button>
						</td>
					</tr>
				</table>
			<br><br><br><br>
			<div class="introimg">
				<img src="/SKI_Final/intro/img/오시는길.PNG" width="1000px" height="700px">
			</div>
			</div>
		</div>
	</div>
</body>
	
<%@include file="/include/mainfooter.jsp" %>
