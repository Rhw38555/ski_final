<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="project" value="/SKI_Final/"/>
<c:set var="location" value="ffBoard/"/>

<c:set var="page_list" value="글 목 록"/>
<c:set var="page_write" value="글 작 성"/>
<c:set var="page_content" value="글 보 기"/>
<c:set var="page_delete" value="글 삭 제"/>
<c:set var="page_modify" value="글 수 정"/>

<c:set var="msg_list_x" value="게시판에 글이 없습니다. 글쓰기를 선택해 주세요."/>
<c:set var="msg_passwd" value="비밀번호를 입력해 주세요"/>

<c:set var="str_name" value="시설명"/>
<c:set var="str_list" value="글목록"/>
<c:set var="str_count" value="전체글"/>
<c:set var="str_write" value="글쓰기"/>
<c:set var="str_num" value="글번호"/>
<c:set var="str_subject" value="한줄 소개"/>
<c:set var="str_division" value="시설 구분"/>
<c:set var="str_category" value="세부 종류"/>
<c:set var="str_introduce" value="시설 소개"/>
<c:set var="str_location" value="시설 위치<br>이미지 등록"/>
<c:set var="str_img" value="상세 이미지 등록"/>
<c:set var="str_thumbnail" value="섬네일 or 로고 등록"/>
<c:set var="str_writer" value="작성자"/>
<c:set var="str_reg_date" value="작성일"/>
<c:set var="str_readcount" value="조회수"/>
<c:set var="str_ip" value="IP"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_content" value="글내용"/>
<c:set var="str_passwd" value="비밀번호"/>

<c:set var="btn_write" value="작성"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_list" value="목록"/>
<c:set var="btn_modify" value="글수정"/>
<c:set var="btn_delete" value="글삭제"/>
<c:set var="btn_reply" value="답글"/>
<c:set var="btn_del" value="삭제"/>
<c:set var="btn_del_cancel" value="삭제취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>