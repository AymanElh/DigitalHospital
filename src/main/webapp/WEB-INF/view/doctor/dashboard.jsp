<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css"/>
</head>
<body class="bg-gray-900 text-gray-100">
<div class="flex h-screen overflow-hidden">

    <!-- Include Doctor Sidebar Component -->
    <jsp:include page="/WEB-INF/view/common/doctor-sidebar.jsp"/>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col overflow-hidden">

        <!-- Include Header Component -->
        <c:set var="pageTitle" value="Doctor Dashboard" scope="request"/>
        <jsp:include page="/WEB-INF/view/common/doctor-header.jsp"/>

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
            <jsp:include page="/WEB-INF/view/doctor/dashboard-content.jsp"/>
        </main>
    </div>
</div>

<!-- Overlay for mobile sidebar -->
<div id="sidebarOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 z-30 md:hidden"
     onclick="toggleSidebar()"></div>

<script>
    // Toggle sidebar for mobile
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const overlay = document.getElementById('sidebarOverlay');
        sidebar.classList.toggle('-translate-x-full');
        overlay.classList.toggle('hidden');
    }

    // Close modals on escape key
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            if (typeof closeModal === 'function') closeModal();
            if (typeof closeDeleteModal === 'function') closeDeleteModal();
        }
    });

    // Hide messages after 5 seconds
    document.addEventListener("DOMContentLoaded", function () {
        const successMessage = document.getElementById("successMessage");
        const errorMessage = document.getElementById("errorMessage");

        function hideMessage(message) {
            if (message) {
                setTimeout(() => {
                    message.style.opacity = "0";
                    message.style.transition = "opacity 0.5s ease";
                    setTimeout(() => message.remove(), 500);
                }, 5000);
            }
        }

        hideMessage(successMessage);
        hideMessage(errorMessage);
    });
</script>
</body>
</html>
