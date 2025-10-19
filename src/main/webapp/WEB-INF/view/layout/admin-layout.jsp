<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle} - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css"/>
</head>
<body class="bg-gray-900 text-gray-100">
<div class="flex h-screen overflow-hidden">

    <!-- Include Sidebar Component -->
    <jsp:include page="/WEB-INF/view/common/admin-sidebar.jsp"/>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col overflow-hidden">

        <!-- Include Header Component -->
        <jsp:include page="/WEB-INF/view/common/admin-header.jsp"/>

        <!-- Main Content -->
        <main class="flex-1 overflow-y-auto bg-gray-900 p-6">
            <!-- Success/Error Messages -->
            <c:if test="${not empty sessionScope.successMessage}">
                <div id="successMessage"
                     class="mb-4 bg-green-900 border border-green-600 text-green-100 px-4 py-3 rounded">
                    <c:out value="${sessionScope.successMessage}"/>
                </div>
                <c:remove var="successMessage" scope="session"/>
            </c:if>

            <c:if test="${not empty sessionScope.errorMessage}">
                <div id="errorMessage" class="mb-4 bg-red-900 border border-red-600 text-red-100 px-4 py-3 rounded">
                    <c:out value="${sessionScope.errorMessage}"/>
                </div>
                <c:remove var="errorMessage" scope="session"/>
            </c:if>

            <!-- Page Content -->
            ${pageContent}
        </main>
    </div>
</div>

<!-- Overlay for mobile sidebar -->
<div id="sidebarOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 z-30 md:hidden"
     onclick="toggleSidebar()"></div>

<script>
    // Auto-hide success/error messages after 5 seconds
    setTimeout(() => {
        const successMsg = document.getElementById('successMessage');
        const errorMsg = document.getElementById('errorMessage');
        if (successMsg) successMsg.style.display = 'none';
        if (errorMsg) errorMsg.style.display = 'none';
    }, 5000);

    // Toggle sidebar for mobile
    function toggleSidebar() {
        const sidebar = document.getElementById('adminSidebar');
        const overlay = document.getElementById('sidebarOverlay');
        sidebar.classList.toggle('-translate-x-full');
        overlay.classList.toggle('hidden');
    }
</script>
</body>
</html>

