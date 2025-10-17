<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- Set the content for the layout -->
<c:set var="pageTitle" value="Departments Management" scope="request"/>
<c:set var="pageContent" scope="request">
    <!-- Include the departments content -->
    <jsp:include page="/WEB-INF/view/admin/department/departments-content.jsp"/>
</c:set>

<!-- Include the admin layout -->
<jsp:include page="/WEB-INF/view/layout/admin-layout.jsp"/>

