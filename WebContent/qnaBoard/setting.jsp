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

<c:set var="msg_passwd" value="비밀번호를 입력해 주세요"/>

<c:set var="str_list" value="글목록"/>
<c:set var="str_count" value="전체글"/>
<c:set var="str_write" value="글쓰기"/>
<c:set var="str_num" value="번호"/>
<c:set var="str_subject" value="제목"/>
<c:set var="str_current_status" value="진행 상태"/>
<c:set var="str_id" value="아이디"/>
<c:set var="str_content" value="문의내용"/>

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