<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css" />
</head>
<body class="bg-gray-900 text-gray-100">
    <div class="flex h-screen overflow-hidden">
        <!-- Sidebar -->
        <aside id="sidebar" class="w-64 bg-gray-800 border-r border-gray-700 flex-shrink-0 transition-transform duration-300 fixed md:relative h-full z-40">
            <div class="flex flex-col h-full">
                <!-- Logo Section -->
                <div class="flex items-center justify-between px-6 py-5 border-b border-gray-700">
                    <div class="flex items-center space-x-3">
                        <div class="bg-blue-600 p-2 rounded">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                            </svg>
                        </div>
                        <div>
                            <h2 class="text-lg font-bold text-white">Admin Panel</h2>
                        </div>
                    </div>
                    <!-- Close button for mobile -->
                    <button onclick="toggleSidebar()" class="md:hidden text-gray-400 hover:text-white">
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>

                <!-- Navigation Menu -->
                <nav class="flex-1 overflow-y-auto py-4">
                    <ul class="space-y-1 px-3">
                        <!-- Dashboard -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/dashboard"
                               class="flex items-center space-x-3 px-4 py-3 rounded-lg transition bg-blue-600 text-white">
                                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                                </svg>
                                <span class="font-medium">Dashboard</span>
                            </a>
                        </li>

                        <!-- Departments -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/departments"
                               class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                                </svg>
                                <span class="font-medium">Departments</span>
                            </a>
                        </li>

                        <!-- Rooms -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/rooms"
                               class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01" />
                                </svg>
                                <span class="font-medium">Rooms</span>
                            </a>
                        </li>

                        <!-- Doctors -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/doctors"
                               class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                </svg>
                                <span class="font-medium">Doctors</span>
                            </a>
                        </li>

                        <!-- Consultations -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/consultations"
                               class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                                </svg>
                                <span class="font-medium">Consultations</span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- User Profile Section -->
                <div class="border-t border-gray-700 p-4">
                    <div class="flex items-center space-x-3 mb-3">
                        <!-- TODO: Get user data from session - ${sessionScope.user} -->
                        <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                                </c:when>
                                <c:otherwise>
                                    AD
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="flex-1 min-w-0">
                            <p class="text-sm font-medium text-white truncate">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                                    </c:when>
                                    <c:otherwise>
                                        Admin User
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p class="text-xs text-gray-400 truncate">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        ${sessionScope.user.email}
                                    </c:when>
                                    <c:otherwise>
                                        admin@clinic.com
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="flex items-center justify-center space-x-2 w-full px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition">
                        <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                        </svg>
                        <span class="text-sm font-medium">Logout</span>
                    </a>
                </div>
            </div>
        </aside>

        <!-- Main Content Area -->
        <div class="flex-1 flex flex-col overflow-hidden">
            <!-- Top Header Bar -->
            <header class="bg-gray-800 border-b border-gray-700 px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                        <!-- Mobile menu button -->
                        <button onclick="toggleSidebar()" class="md:hidden text-gray-400 hover:text-white">
                            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                            </svg>
                        </button>
                        <h1 class="text-xl font-bold text-white">Dashboard</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-sm text-gray-400">
                            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="EEEE, dd MMM yyyy" />
                        </span>
                    </div>
                </div>
            </header>

            <!-- Main Content -->
            <main class="flex-1 overflow-y-auto bg-gray-900 p-6">
                <!-- Success/Error Messages -->
                <c:if test="${not empty sessionScope.successMessage}">
                    <div id="successMessage" class="mb-4 bg-green-900 border border-green-600 text-green-100 px-4 py-3 rounded">
                        <c:out value="${sessionScope.successMessage}" />
                    </div>
                    <c:remove var="successMessage" scope="session"/>
                </c:if>

                <c:if test="${not empty sessionScope.errorMessage}">
                    <div id="errorMessage" class="mb-4 bg-red-900 border border-red-600 text-red-100 px-4 py-3 rounded">
                        <c:out value="${sessionScope.errorMessage}" />
                    </div>
                    <c:remove var="errorMessage" scope="session"/>
                </c:if>

                <!-- Dashboard Content -->
                <!-- Dashboard Statistics Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <!-- TODO: Get these statistics from servlet - ${stats.totalDoctors}, etc -->

                    <!-- Total Doctors -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-400 mb-1">Total Doctors</p>
                                <p class="text-3xl font-bold text-white">24</p>
                                <p class="text-xs text-green-500 mt-2">↑ 12% from last month</p>
                            </div>
                            <div class="bg-blue-600 p-4 rounded-lg">
                                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Total Patients -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-400 mb-1">Total Patients</p>
                                <p class="text-3xl font-bold text-white">1,247</p>
                                <p class="text-xs text-green-500 mt-2">↑ 8% from last month</p>
                            </div>
                            <div class="bg-green-600 p-4 rounded-lg">
                                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Total Consultations -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-400 mb-1">Consultations Today</p>
                                <p class="text-3xl font-bold text-white">42</p>
                                <p class="text-xs text-yellow-500 mt-2">18 pending approval</p>
                            </div>
                            <div class="bg-purple-600 p-4 rounded-lg">
                                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Available Rooms -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-400 mb-1">Available Rooms</p>
                                <p class="text-3xl font-bold text-white">8/12</p>
                                <p class="text-xs text-gray-400 mt-2">4 rooms occupied</p>
                            </div>
                            <div class="bg-orange-600 p-4 rounded-lg">
                                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity and Charts -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    <!-- Recent Consultations -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h2 class="text-lg font-bold text-white">Recent Consultations</h2>
                            <a href="${pageContext.request.contextPath}/admin/consultations"
                               class="text-sm text-blue-500 hover:text-blue-400">View All</a>
                        </div>

                        <!-- TODO: Loop through recent consultations from servlet -->
                        <div class="space-y-3">
                            <!-- Consultation Item 1 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                                        JD
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">John Doe - Dr. Smith</p>
                                        <p class="text-xs text-gray-400">Today at 10:30 AM</p>
                                    </div>
                                </div>
                                <span class="px-3 py-1 text-xs font-medium bg-yellow-600 text-white rounded-full">Pending</span>
                            </div>

                            <!-- Consultation Item 2 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center text-white font-semibold">
                                        SA
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">Sarah Anderson - Dr. Johnson</p>
                                        <p class="text-xs text-gray-400">Today at 11:00 AM</p>
                                    </div>
                                </div>
                                <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Completed</span>
                            </div>

                            <!-- Consultation Item 3 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                        MB
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">Michael Brown - Dr. Lee</p>
                                        <p class="text-xs text-gray-400">Today at 2:00 PM</p>
                                    </div>
                                </div>
                                <span class="px-3 py-1 text-xs font-medium bg-blue-600 text-white rounded-full">Confirmed</span>
                            </div>
                        </div>
                    </div>

                    <!-- Department Overview -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h2 class="text-lg font-bold text-white">Departments Overview</h2>
                            <a href="${pageContext.request.contextPath}/admin/departments"
                               class="text-sm text-blue-500 hover:text-blue-400">Manage</a>
                        </div>

                        <!-- TODO: Loop through departments from servlet -->
                        <div class="space-y-3">
                            <!-- Department Item 1 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="bg-blue-600 p-2 rounded">
                                        <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">Cardiology</p>
                                        <p class="text-xs text-gray-400">5 doctors</p>
                                    </div>
                                </div>
                                <span class="text-sm text-green-500">Active</span>
                            </div>

                            <!-- Department Item 2 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="bg-green-600 p-2 rounded">
                                        <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                        </svg>
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">Neurology</p>
                                        <p class="text-xs text-gray-400">4 doctors</p>
                                    </div>
                                </div>
                                <span class="text-sm text-green-500">Active</span>
                            </div>

                            <!-- Department Item 3 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="bg-purple-600 p-2 rounded">
                                        <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                                        </svg>
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">Orthopedics</p>
                                        <p class="text-xs text-gray-400">6 doctors</p>
                                    </div>
                                </div>
                                <span class="text-sm text-green-500">Active</span>
                            </div>

                            <!-- Department Item 4 -->
                            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="bg-orange-600 p-2 rounded">
                                        <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                    </div>
                                    <div>
                                        <p class="text-sm font-medium text-white">Pediatrics</p>
                                        <p class="text-xs text-gray-400">3 doctors</p>
                                    </div>
                                </div>
                                <span class="text-sm text-green-500">Active</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts Section -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mt-6">
                    <!-- Monthly Consultations Chart -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-lg font-bold text-white">Monthly Consultations</h2>
                            <select class="bg-gray-700 text-white text-sm px-3 py-1 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
                                <option>Last 6 Months</option>
                                <option>Last 12 Months</option>
                                <option>This Year</option>
                            </select>
                        </div>

                        <!-- TODO: Replace with actual chart data from servlet -->
                        <div class="space-y-4">
                            <!-- Bar Chart -->
                            <div class="flex items-end justify-between h-48 gap-3">
                                <!-- May -->
                                <div class="flex-1 flex flex-col items-center">
                                    <div class="w-full bg-blue-600 rounded-t transition-all hover:bg-blue-500" style="height: 60%;"></div>
                                    <span class="text-xs text-gray-400 mt-2">May</span>
                                    <span class="text-xs text-white font-semibold">320</span>
                                </div>
                                <!-- Jun -->
                                <div class="flex-1 flex flex-col items-center">
                                    <div class="w-full bg-blue-600 rounded-t transition-all hover:bg-blue-500" style="height: 75%;"></div>
                                    <span class="text-xs text-gray-400 mt-2">Jun</span>
                                    <span class="text-xs text-white font-semibold">398</span>
                                </div>
                                <!-- Jul -->
                                <div class="flex-1 flex flex-col items-center">
                                    <div class="w-full bg-blue-600 rounded-t transition-all hover:bg-blue-500" style="height: 55%;"></div>
                                    <span class="text-xs text-gray-400 mt-2">Jul</span>
                                    <span class="text-xs text-white font-semibold">289</span>
                                </div>
                                <!-- Aug -->
                                <div class="flex-1 flex flex-col items-center">
                                    <div class="w-full bg-blue-600 rounded-t transition-all hover:bg-blue-500" style="height: 85%;"></div>
                                    <span class="text-xs text-gray-400 mt-2">Aug</span>
                                    <span class="text-xs text-white font-semibold">445</span>
                                </div>
                                <!-- Sep -->
                                <div class="flex-1 flex flex-col items-center">
                                    <div class="w-full bg-blue-600 rounded-t transition-all hover:bg-blue-500" style="height: 70%;"></div>
                                    <span class="text-xs text-gray-400 mt-2">Sep</span>
                                    <span class="text-xs text-white font-semibold">367</span>
                                </div>
                                <!-- Oct -->
                                <div class="flex-1 flex flex-col items-center">
                                    <div class="w-full bg-green-600 rounded-t transition-all hover:bg-green-500" style="height: 95%;"></div>
                                    <span class="text-xs text-gray-400 mt-2">Oct</span>
                                    <span class="text-xs text-white font-semibold">498</span>
                                </div>
                            </div>

                            <!-- Legend -->
                            <div class="flex items-center justify-between pt-4 border-t border-gray-700">
                                <div class="flex items-center space-x-4">
                                    <div class="flex items-center space-x-2">
                                        <div class="w-3 h-3 bg-green-600 rounded"></div>
                                        <span class="text-xs text-gray-400">Current Month</span>
                                    </div>
                                    <div class="flex items-center space-x-2">
                                        <div class="w-3 h-3 bg-blue-600 rounded"></div>
                                        <span class="text-xs text-gray-400">Previous Months</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="text-xs text-gray-400">Total</p>
                                    <p class="text-lg font-bold text-white">2,317</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Patient Status Distribution Chart -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-lg font-bold text-white">Consultation Status</h2>
                            <span class="text-xs text-gray-400">This Month</span>
                        </div>

                        <!-- TODO: Replace with actual data from servlet -->
                        <div class="flex flex-col items-center justify-center">
                            <!-- Donut Chart (Visual representation) -->
                            <div class="relative w-48 h-48 mb-6">
                                <svg class="transform -rotate-90" viewBox="0 0 100 100">
                                    <!-- Completed (Green) - 45% -->
                                    <circle cx="50" cy="50" r="40" fill="none" stroke="#1f2937" stroke-width="20"/>
                                    <circle cx="50" cy="50" r="40" fill="none" stroke="#16a34a" stroke-width="20"
                                            stroke-dasharray="113 251" stroke-dashoffset="0" class="transition-all"/>
                                    <!-- Confirmed (Blue) - 30% -->
                                    <circle cx="50" cy="50" r="40" fill="none" stroke="#2563eb" stroke-width="20"
                                            stroke-dasharray="75 251" stroke-dashoffset="-113" class="transition-all"/>
                                    <!-- Pending (Yellow) - 20% -->
                                    <circle cx="50" cy="50" r="40" fill="none" stroke="#ca8a04" stroke-width="20"
                                            stroke-dasharray="50 251" stroke-dashoffset="-188" class="transition-all"/>
                                    <!-- Cancelled (Red) - 5% -->
                                    <circle cx="50" cy="50" r="40" fill="none" stroke="#dc2626" stroke-width="20"
                                            stroke-dasharray="13 251" stroke-dashoffset="-238" class="transition-all"/>
                                </svg>
                                <div class="absolute inset-0 flex flex-col items-center justify-center">
                                    <p class="text-3xl font-bold text-white">498</p>
                                    <p class="text-xs text-gray-400">Total</p>
                                </div>
                            </div>

                            <!-- Legend -->
                            <div class="w-full space-y-3">
                                <!-- Completed -->
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-4 h-4 bg-green-600 rounded"></div>
                                        <span class="text-sm text-gray-300">Completed</span>
                                    </div>
                                    <div class="text-right">
                                        <span class="text-sm font-semibold text-white">224</span>
                                        <span class="text-xs text-gray-400 ml-2">(45%)</span>
                                    </div>
                                </div>
                                <!-- Confirmed -->
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-4 h-4 bg-blue-600 rounded"></div>
                                        <span class="text-sm text-gray-300">Confirmed</span>
                                    </div>
                                    <div class="text-right">
                                        <span class="text-sm font-semibold text-white">149</span>
                                        <span class="text-xs text-gray-400 ml-2">(30%)</span>
                                    </div>
                                </div>
                                <!-- Pending -->
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-4 h-4 bg-yellow-600 rounded"></div>
                                        <span class="text-sm text-gray-300">Pending</span>
                                    </div>
                                    <div class="text-right">
                                        <span class="text-sm font-semibold text-white">100</span>
                                        <span class="text-xs text-gray-400 ml-2">(20%)</span>
                                    </div>
                                </div>
                                <!-- Cancelled -->
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-4 h-4 bg-red-600 rounded"></div>
                                        <span class="text-sm text-gray-300">Cancelled</span>
                                    </div>
                                    <div class="text-right">
                                        <span class="text-sm font-semibold text-white">25</span>
                                        <span class="text-xs text-gray-400 ml-2">(5%)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Overlay for mobile sidebar -->
    <div id="sidebarOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 z-30 md:hidden" onclick="toggleSidebar()"></div>

    <script>
        // Toggle sidebar for mobile
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const overlay = document.getElementById('sidebarOverlay');

            sidebar.classList.toggle('-translate-x-full');
            overlay.classList.toggle('hidden');
        }

        // Hide messages after 5 seconds
        document.addEventListener("DOMContentLoaded", function() {
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
