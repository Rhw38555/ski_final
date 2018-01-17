<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="project" value="/SKI_Final/"/>
<c:set var="location" value="ffBoard/"/>

<c:set var="msg_adminlist_x" value="진행중인 이벤트가 없습니다. 새 이벤트를 게시해주세요."/>
<c:set var="msg_list_x" value="진행중인 이벤트가 없습니다."/>
<c:set var="msg_del_check" value="이벤트를 삭제하시겠습니까?"/>

<c:set var="str_list" value="목록"/>
<c:set var="str_count" value="진행중 이벤트"/>
<c:set var="str_write" value="이벤트 게시"/>
<c:set var="str_subject" value="이벤트 제목"/>
<c:set var="str_content" value="이벤트 내용"/>

<c:set var="btn_write" value="작성"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_list" value="목록"/>
<c:set var="btn_modify" value="이벤트 수정"/>
<c:set var="btn_delete" value="이벤트 삭제"/>
<c:set var="btn_del" value="이벤트 삭제"/>
<c:set var="btn_del_cancel" value="삭제 취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정 취소"/>