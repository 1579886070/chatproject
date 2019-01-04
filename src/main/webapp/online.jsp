<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh">
<head>

<table width="100%" border="0" cellpadding="0"  cellspacing="0" align="left">
    <tr>
        <td height="30" align="center">当前在线[<font color="#FF6600">${ fn:length(userMap) }</font>]人</td>
    </tr>
    <c:forEach var="entry" items="${ userMap }">
        <tr>
            <td height="23" align="center">
                    ${ entry.key.nickname }
            </td>
        </tr>
    </c:forEach>
</table>
</head>
</html>