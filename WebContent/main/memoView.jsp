<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			//<!--
				function writecheck() {
				if( ! mod.memoP.value ) {
					mod.memoP.focus();
					return false;
				}
			}
			//-->
		</script>
		<style>
			textarea{
				resize: none;
			}
		</style>
	</head>
	<body>
		<form name="mod" action="memoWrite.do" onsubmit="return writecheck()">
		<c:if test="${memoDto == null}">
			<input type="hidden" name="day_check" value="${day_check}">
			<input type="hidden" name="check" value="1">
			<div>
				<div align="center">
					<textarea name="memoP" cols="50" rows="10" placeholder="메모를 입력하세요."></textarea>
				</div>
				<div align="center">
					<input type="submit" value="저장">
				</div>
			</div>
		</c:if>
		<c:if test="${memoDto != null}">
			<input type="hidden" name="check" value="2">
			<div >
				<fmt:formatDate value="${memoDto.memo_date}" var="memoDate" pattern="YYYY/MM/DD"/>
				${memoDate} 에 남김 <br>
				<pre>${memoDto.memo}</pre>
				<hr>
				<input type="button" value="수정" onclick="location='memoModify.do?day_check=${day_check}&startDate=${startDate}&endDate=${endDate}'">
				<input type="button" value="삭제" onclick="location='memoDelete.do?day_check=${day_check}&startDate=${startDate}&endDate=${endDate}'">
			</div>
		</c:if>
		</form>
	</body>
</html>