<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Consultations - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css"/>
</head>
<body class="bg-gray-900 text-gray-100">
<div class="flex h-screen overflow-hidden">

    <!-- Include Doctor Sidebar Component -->
    <jsp:include page="/WEB-INF/view/common/doctor-sidebar.jsp"/>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col overflow-hidden">

        <!-- Include Header Component -->
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

            <!-- Page Header -->
            <div class="mb-6">
                <h1 class="text-2xl font-bold text-white">My Consultations</h1>
                <p class="text-gray-400 mt-1">View and manage all your patient consultations</p>
            </div>

            <!-- Consultations Table -->
            <div class="bg-gray-800 rounded-lg border border-gray-700">
                <div class="px-6 py-4 border-b border-gray-700">
                    <h2 class="text-xl font-semibold text-white">All Consultations</h2>
                </div>

                <div class="p-6">
                    <c:choose>
                        <c:when test="${empty consultations}">
                            <div class="text-center py-12">
                                <svg class="mx-auto h-12 w-12 text-gray-600 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                                <p class="text-gray-400 text-lg">No consultations found</p>
                                <p class="text-gray-500 text-sm mt-2">You don't have any consultations yet</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                        <tr class="text-left text-xs text-gray-400 uppercase tracking-wider">
                                            <th class="px-4 py-3">Patient</th>
                                            <th class="px-4 py-3">Date & Time</th>
                                            <th class="px-4 py-3">Status</th>
                                            <th class="px-4 py-3">Reason</th>
                                            <th class="px-4 py-3">Medical Report</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-700">
                                        <c:forEach var="consultation" items="${consultations}">
                                            <tr class="hover:bg-gray-700 transition">
                                                <td class="px-4 py-4">
                                                    <div class="flex items-center space-x-3">
                                                        <div class="w-8 h-8 rounded-full bg-purple-600 flex items-center justify-center text-white text-sm font-semibold">
                                                            ${consultation.patient.firstName.substring(0,1).toUpperCase()}${consultation.patient.lastName.substring(0,1).toUpperCase()}
                                                        </div>
                                                        <div>
                                                            <p class="text-white font-medium">
                                                                <c:out value="${consultation.patient.firstName} ${consultation.patient.lastName}"/>
                                                            </p>
                                                            <p class="text-sm text-gray-400">
                                                                <c:out value="${consultation.patient.email}"/>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4">
                                                    <div class="text-gray-300">
                                                        <p class="font-medium">
                                                            <c:out value="${consultation.consultationDate}"/>
                                                        </p>
                                                        <p class="text-sm text-gray-400">
                                                            <c:if test="${consultation.consultationSlot != null}">
                                                                ${consultation.consultationSlot.startTime.hour}:${consultation.consultationSlot.startTime.minute < 10 ? '0' : ''}${consultation.consultationSlot.startTime.minute}
                                                                -
                                                                ${consultation.consultationSlot.endTime.hour}:${consultation.consultationSlot.endTime.minute < 10 ? '0' : ''}${consultation.consultationSlot.endTime.minute}
                                                            </c:if>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4">
                                                    <c:choose>
                                                        <c:when test="${consultation.consultationStatus == 'COMPLETED'}">
                                                            <span class="inline-block px-3 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                                                Completed
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${consultation.consultationStatus == 'VALIDATED'}">
                                                            <span class="inline-block px-3 py-1 text-xs rounded bg-blue-900 text-blue-300 border border-blue-700">
                                                                Validated
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${consultation.consultationStatus == 'RESERVED'}">
                                                            <span class="inline-block px-3 py-1 text-xs rounded bg-yellow-900 text-yellow-300 border border-yellow-700">
                                                                Reserved
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${consultation.consultationStatus == 'CANCELED'}">
                                                            <span class="inline-block px-3 py-1 text-xs rounded bg-red-900 text-red-300 border border-red-700">
                                                                Cancelled
                                                            </span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td class="px-4 py-4 text-gray-300 max-w-xs truncate">
                                                    <c:out value="${consultation.reason}"/>
                                                </td>
                                                <td class="px-4 py-4 text-gray-300 max-w-xs truncate">
                                                    <c:choose>
                                                        <c:when test="${not empty consultation.medicalReport}">
                                                            <c:out value="${consultation.medicalReport}"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-gray-500 italic">No report</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
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

