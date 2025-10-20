<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Schedule - Digital Clinic</title>
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

            <!-- Schedule Header -->
            <div class="mb-6">
                <div class="flex items-center justify-between mb-4">
                    <div>
                        <h1 class="text-2xl font-bold text-white">My Schedule</h1>
                        <p class="text-gray-400">
                            <c:out value="${formattedDate}"/>
                        </p>
                    </div>

                    <!-- Date Navigation -->
                    <div class="flex items-center space-x-4">
                        <button onclick="previousDay()"
                                class="p-2 text-gray-400 hover:text-white hover:bg-gray-700 rounded-lg transition">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                            </svg>
                        </button>

                        <input type="date" id="dateSelector"
                               value="${selectedDate}"
                               onchange="changeDate()"
                               class="px-3 py-2 bg-gray-800 border border-gray-600 text-white rounded-lg focus:outline-none focus:border-blue-500">

                        <button onclick="nextDay()"
                                class="p-2 text-gray-400 hover:text-white hover:bg-gray-700 rounded-lg transition">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                            </svg>
                        </button>

                        <button onclick="goToToday()"
                                class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                            Today
                        </button>
                    </div>
                </div>
            </div>

            <!-- Schedule Content -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

                <!-- Main Schedule Timeline -->
                <div class="lg:col-span-2">
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h2 class="text-lg font-bold text-white">Today's Appointments</h2>
                            <div class="flex items-center space-x-2 text-sm text-gray-400">
                                <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                                <span>Confirmed</span>
                                <div class="w-3 h-3 bg-yellow-500 rounded-full ml-4"></div>
                                <span>Pending</span>
                                <div class="w-3 h-3 bg-red-500 rounded-full ml-4"></div>
                                <span>Cancelled</span>
                            </div>
                        </div>

                        <div class="space-y-4">
                            <!-- Time Slots -->
                            <c:choose>
                                <c:when test="${not empty daySchedule}">
                                    <c:forEach var="slot" items="${daySchedule}">
                                        <div class="flex items-center space-x-4 p-4 bg-gray-700 rounded-lg
                                             ${slot.consultation != null ?
                                               (slot.consultation.consultationStatus == 'VALIDATED' ? 'border-l-4 border-green-500' :
                                                slot.consultation.consultationStatus == 'RESERVED' ? 'border-l-4 border-yellow-500' :
                                                slot.consultation.consultationStatus == 'CANCELED' ? 'border-l-4 border-red-500' :
                                                'border-l-4 border-blue-500') : 'border-l-4 border-gray-600'}">

                                            <!-- Time -->
                                            <div class="text-center min-w-0 flex-shrink-0">
                                                <div class="text-sm font-medium text-white">
                                                    <c:out value="${slot.startTime}"/>
                                                </div>
                                                <div class="text-xs text-gray-400">
                                                    <c:out value="${slot.endTime}"/>
                                                </div>
                                            </div>

                                            <!-- Appointment Details -->
                                            <div class="flex-1">
                                                <c:choose>
                                                    <c:when test="${slot.consultation != null}">
                                                        <div class="flex items-center justify-between">
                                                            <div>
                                                                <p class="text-sm font-medium text-white">
                                                                    <c:out value="${slot.consultation.patient.firstName} ${slot.consultation.patient.lastName}"/>
                                                                </p>
                                                                <p class="text-xs text-gray-400">
                                                                    <c:out value="${slot.consultation.reason}"/>
                                                                </p>
                                                                <p class="text-xs text-blue-400 mt-1">
                                                                    Room: <c:out value="${slot.room != null ? slot.room.roomNumber : 'TBD'}"/>
                                                                </p>
                                                            </div>
                                                            <div class="flex items-center space-x-2">
                                                                <span class="px-2 py-1 text-xs font-medium rounded-full
                                                                    ${slot.consultation.consultationStatus == 'VALIDATED' ? 'bg-green-600 text-white' :
                                                                      slot.consultation.consultationStatus == 'RESERVED' ? 'bg-yellow-600 text-white' :
                                                                      slot.consultation.consultationStatus == 'CANCELED' ? 'bg-red-600 text-white' :
                                                                      'bg-blue-600 text-white'}">
                                                                    <c:out value="${slot.consultation.consultationStatus}"/>
                                                                </span>
                                                                <c:if test="${slot.consultation.consultationStatus == 'RESERVED'}">
                                                                    <button onclick="approveConsultation(${slot.consultation.id})"
                                                                            class="px-3 py-1 text-xs bg-green-600 hover:bg-green-700 text-white rounded transition">
                                                                        Approve
                                                                    </button>
                                                                    <button onclick="declineConsultation(${slot.consultation.id})"
                                                                            class="px-3 py-1 text-xs bg-red-600 hover:bg-red-700 text-white rounded transition">
                                                                        Decline
                                                                    </button>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="flex items-center justify-between">
                                                            <div>
                                                                <p class="text-sm text-gray-400">Available Slot</p>
                                                                <p class="text-xs text-gray-500">No appointment scheduled</p>
                                                            </div>
                                                            <span class="px-2 py-1 text-xs font-medium bg-gray-600 text-gray-300 rounded-full">
                                                                Free
                                                            </span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <!-- No Schedule Available -->
                                    <div class="text-center py-12">
                                        <svg class="mx-auto h-12 w-12 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                        <h3 class="mt-2 text-sm font-medium text-gray-300">No schedule for this day</h3>
                                        <p class="mt-1 text-sm text-gray-500">You don't have any appointments scheduled for this date.</p>
                                        <div class="mt-6">
                                            <button onclick="goToToday()" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition text-sm">
                                                Go to Today
                                            </button>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Side Panel -->
                <div class="space-y-6">
                    <!-- Schedule Summary -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <h3 class="text-lg font-bold text-white mb-4">Schedule Summary</h3>

                        <div class="space-y-3">
                            <div class="flex items-center justify-between">
                                <span class="text-sm text-gray-400">Total Appointments</span>
                                <span class="text-sm font-medium text-white">
                                    <c:out value="${daySchedule != null ? daySchedule.size() : 0}"/>
                                </span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span class="text-sm text-gray-400">Confirmed</span>
                                <span class="text-sm font-medium text-green-400">0</span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span class="text-sm text-gray-400">Pending Approval</span>
                                <span class="text-sm font-medium text-yellow-400">0</span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span class="text-sm text-gray-400">Available Slots</span>
                                <span class="text-sm font-medium text-blue-400">
                                    <c:out value="${daySchedule != null ? daySchedule.size() : 0}"/>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <h3 class="text-lg font-bold text-white mb-4">Quick Actions</h3>

                        <div class="space-y-3">
                            <button class="w-full px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition text-sm">
                                Block Time Slot
                            </button>
                            <button class="w-full px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition text-sm">
                                Add Emergency Slot
                            </button>
                            <button class="w-full px-4 py-2 bg-purple-600 hover:bg-purple-700 text-white rounded-lg transition text-sm">
                                View Patient Records
                            </button>
                            <button class="w-full px-4 py-2 bg-orange-600 hover:bg-orange-700 text-white rounded-lg transition text-sm">
                                Export Schedule
                            </button>
                        </div>
                    </div>

                    <!-- Information Box -->
                    <div class="bg-blue-900 bg-opacity-30 border border-blue-600 rounded-lg p-6">
                        <h3 class="text-lg font-bold text-blue-400 mb-2">📅 Schedule Info</h3>
                        <p class="text-sm text-blue-300">
                            Your schedule shows all time slots for the selected date. Appointments will appear here once patients book consultations.
                        </p>
                    </div>
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

    // Consultation actions
    function approveConsultation(consultationId) {
        if (confirm('Are you sure you want to approve this consultation?')) {
            fetch('${pageContext.request.contextPath}/doctor/consultation/approve', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'consultationId=' + consultationId
            })
            .then(response => {
                if (response.ok) {
                    location.reload();
                } else {
                    alert('Failed to approve consultation');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred');
            });
        }
    }

    function declineConsultation(consultationId) {
        if (confirm('Are you sure you want to decline this consultation?')) {
            fetch('${pageContext.request.contextPath}/doctor/consultation/decline', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'consultationId=' + consultationId
            })
            .then(response => {
                if (response.ok) {
                    location.reload();
                } else {
                    alert('Failed to decline consultation');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred');
            });
        }
    }

    // Date navigation functions
    function changeDate() {
        const dateSelector = document.getElementById('dateSelector');
        const selectedDate = dateSelector.value;
        window.location.href = '${pageContext.request.contextPath}/doctor/schedule?date=' + selectedDate;
    }

    function previousDay() {
        const dateSelector = document.getElementById('dateSelector');
        const currentDate = new Date(dateSelector.value);
        currentDate.setDate(currentDate.getDate() - 1);
        const newDate = currentDate.toISOString().split('T')[0];
        window.location.href = '${pageContext.request.contextPath}/doctor/schedule?date=' + newDate;
    }

    function nextDay() {
        const dateSelector = document.getElementById('dateSelector');
        const currentDate = new Date(dateSelector.value);
        currentDate.setDate(currentDate.getDate() + 1);
        const newDate = currentDate.toISOString().split('T')[0];
        window.location.href = '${pageContext.request.contextPath}/doctor/schedule?date=' + newDate;
    }

    function goToToday() {
        const today = new Date().toISOString().split('T')[0];
        window.location.href = '${pageContext.request.contextPath}/doctor/schedule?date=' + today;
    }

    function selectDate(date) {
        window.location.href = '${pageContext.request.contextPath}/doctor/schedule?date=' + date;
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
