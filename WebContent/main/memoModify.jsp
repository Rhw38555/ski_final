<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<form action="memoWrite.do">
			<input type="hidden" name="day_check" value="${day_check}">
			<input type="hidden" name="startDate" value="${startDate}">
			<input type="hidden" name="endDate" value="${endDate}">
			<input type="hidden" name="check" value="2">
			<div>
				<div align="center">
					<textarea name="memoP" cols="50" rows="10" placeholder="메모를 입력하세요.">${memoDto.memo}</textarea>
				</div>
				<div align="center">
					<input type="submit" value="저장">
				</div>
			</div>
		</form>
	</body>
</html>