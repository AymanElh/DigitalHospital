<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rooms Management - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css"/>
</head>
<body class="bg-gray-900 text-gray-100">
<div class="flex h-screen overflow-hidden">
    <!-- Sidebar -->
    <aside id="sidebar"
           class="w-64 bg-gray-800 border-r border-gray-700 flex-shrink-0 transition-transform duration-300 fixed md:relative h-full z-40">
        <div class="flex flex-col h-full">
            <!-- Logo Section -->
            <div class="flex items-center justify-between px-6 py-5 border-b border-gray-700">
                <div class="flex items-center space-x-3">
                    <div class="bg-blue-600 p-2 rounded">
                        <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                        </svg>
                    </div>
                    <div>
                        <h2 class="text-lg font-bold text-white">Admin Panel</h2>
                    </div>
                </div>
                <button onclick="toggleSidebar()" class="md:hidden text-gray-400 hover:text-white">
                    <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                </button>
            </div>

            <!-- Navigation Menu -->
            <nav class="flex-1 overflow-y-auto py-4">
                <ul class="space-y-1 px-3">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                            </svg>
                            <span class="font-medium">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/departments"
                           class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                            </svg>
                            <span class="font-medium">Departments</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/rooms"
                           class="flex items-center space-x-3 px-4 py-3 rounded-lg transition bg-blue-600 text-white">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01"/>
                            </svg>
                            <span class="font-medium">Rooms</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/doctors"
                           class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                            </svg>
                            <span class="font-medium">Doctors</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/consultations"
                           class="flex items-center space-x-3 px-4 py-3 rounded-lg transition text-gray-300 hover:bg-gray-700 hover:text-white">
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/>
                            </svg>
                            <span class="font-medium">Consultations</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <!-- User Profile Section -->
            <div class="border-t border-gray-700 p-4">
                <div class="flex items-center space-x-3 mb-3">
                    <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                            </c:when>
                            <c:otherwise>AD</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-medium text-white truncate">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                                </c:when>
                                <c:otherwise>Admin User</c:otherwise>
                            </c:choose>
                        </p>
                        <p class="text-xs text-gray-400 truncate">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    ${sessionScope.user.email}
                                </c:when>
                                <c:otherwise>admin@clinic.com</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/logout"
                   class="flex items-center justify-center space-x-2 w-full px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition">
                    <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
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
                    <button onclick="toggleSidebar()" class="md:hidden text-gray-400 hover:text-white">
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4 6h16M4 12h16M4 18h16"/>
                        </svg>
                    </button>
                    <h1 class="text-xl font-bold text-white">Rooms Management</h1>
                </div>
                <div class="flex items-center space-x-4">
                        <span class="text-sm text-gray-400">
                            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="EEEE, dd MMM yyyy"/>
                        </span>
                </div>
            </div>
        </header>

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

            <!-- Page Header with Add Button -->
            <div class="flex items-center justify-between mb-6">
                <div>
                    <h2 class="text-2xl font-bold text-white mb-2">Rooms Management</h2>
                    <p class="text-gray-400">Manage consultation rooms and their availability</p>
                </div>
                <button onclick="openCreateModal()"
                        class="flex items-center space-x-2 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg transition">
                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                    </svg>
                    <span>Add Room</span>
                </button>
            </div>

            <!-- Room Statistics -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                <!-- TODO: Get statistics from servlet -->
                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-400 mb-1">Total Rooms</p>
                            <p class="text-3xl font-bold text-white">12</p>
                        </div>
                        <div class="bg-blue-600 p-3 rounded-lg">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-400 mb-1">Available Now</p>
                            <p class="text-3xl font-bold text-white">8</p>
                        </div>
                        <div class="bg-green-600 p-3 rounded-lg">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-400 mb-1">Occupied</p>
                            <p class="text-3xl font-bold text-white">4</p>
                        </div>
                        <div class="bg-red-600 p-3 rounded-lg">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Rooms Table -->
            <div class="bg-gray-800 border border-gray-700 rounded-lg overflow-hidden">
                <!-- Table Header -->
                <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
                    <h3 class="text-lg font-semibold text-white">All Rooms</h3>
                    <div class="flex items-center space-x-3">
                        <select class="bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Status</option>
                            <option value="available">Available</option>
                            <option value="occupied">Occupied</option>
                        </select>
                        <div class="relative">
                            <input type="text"
                                   placeholder="Search rooms..."
                                   class="bg-gray-700 text-white px-4 py-2 rounded-lg pl-10 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <svg class="h-5 w-5 text-gray-400 absolute left-3 top-2.5" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Table -->
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-700">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">
                                Room Number
                            </th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">
                                Doctor
                            </th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">
                                Status
                            </th>
                            <th class="px-6 py-3 text-right text-xs font-medium text-gray-300 uppercase tracking-wider">
                                Actions
                            </th>
                        </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-700">
                        <!-- TODO: Loop through rooms list from servlet using foreach -->
                        <c:forEach items="${rooms}" var="room">
                            <tr class="hover:bg-gray-750 transition">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center space-x-3">
                                        <div class="bg-blue-600 w-10 h-10 rounded flex items-center justify-center">
                                            <span class="text-white font-bold text-sm">${room.roomNumber}</span>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-white">Doctor
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Available</span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                                    <button onclick="viewRoomSchedule(101)"
                                            class="text-purple-500 hover:text-purple-400 mr-3 transition"
                                            title="View Schedule">
                                        <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24"
                                             stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                        </svg>
                                    </button>
                                    <button onclick="openEditModal(1, '101', 'Consultation Room A', 1, '4', 'ECG, Monitor, Bed')"
                                            class="text-blue-500 hover:text-blue-400 mr-3 transition">
                                        <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24"
                                             stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                        </svg>
                                    </button>
                                    <button onclick="confirmDelete(1, '101')"
                                            class="text-red-500 hover:text-red-400 transition">
                                        <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24"
                                             stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Create/Edit Room Modal -->
            <div id="roomModal"
                 class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
                <div class="bg-gray-800 rounded-lg max-w-lg w-full border border-gray-700">
                    <div class="flex items-center justify-between px-6 py-4 border-b border-gray-700">
                        <h3 id="modalTitle" class="text-lg font-bold text-white">Add New Room</h3>
                        <button onclick="closeModal()" class="text-gray-400 hover:text-white">
                            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M6 18L18 6M6 6l12 12"/>
                            </svg>
                        </button>
                    </div>

                    <!-- TODO: Form action should point to servlet URL -->
                    <form id="roomForm" method="POST" action="${pageContext.request.contextPath}/admin/rooms"
                          class="px-6 py-4">
                        <input type="hidden" id="roomId" name="id" value="">
                        <input type="hidden" id="formAction" name="action" value="create">

                        <div class="mb-4">
                            <div>
                                <label for="roomNumber" class="block text-sm font-medium text-gray-300 mb-2">Room Number
                                    *</label>
                                <input type="text" id="roomNumber" name="roomNumber" required
                                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                       placeholder="e.g., 101">
                            </div>
                        </div>

                        <div class="flex justify-end space-x-3">
                            <button type="button" onclick="closeModal()"
                                    class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                                Cancel
                            </button>
                            <button type="submit"
                                    class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                                <span id="submitButtonText">Create Room</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteModal"
                 class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
                <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
                    <div class="px-6 py-4">
                        <div class="flex items-center justify-center w-12 h-12 rounded-full bg-red-900 mx-auto mb-4">
                            <svg class="h-6 w-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-white text-center mb-2">Delete Room</h3>
                        <p class="text-gray-400 text-center mb-6">
                            Are you sure you want to delete Room <span id="deleteRoomNumber"
                                                                       class="text-white font-semibold"></span>?
                            This action cannot be undone.
                        </p>

                        <!-- TODO: Form should submit to servlet -->
                        <form id="deleteForm" method="POST" action="#">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="deleteId" name="id" value="">

                            <div class="flex justify-center space-x-3">
                                <button type="button" onclick="closeDeleteModal()"
                                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                                    Cancel
                                </button>
                                <button type="submit"
                                        class="px-6 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition">
                                    Delete
                                </button>
                            </div>
                        </form>
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

    // Open create modal
    function openCreateModal() {
        console.log("Opening a modal");
        document.getElementById('modalTitle').textContent = 'Add New Room';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitButtonText').textContent = 'Create Room';
        document.getElementById('roomId').value = '';
        document.getElementById('roomNumber').value = '';
        document.getElementById('roomModal').classList.remove('hidden');
    }

    // Open edit modal
    function openEditModal(id, roomNumber, name, deptId, capacity, equipment) {
        document.getElementById('modalTitle').textContent = 'Edit Room';
        document.getElementById('formAction').value = 'update';
        document.getElementById('submitButtonText').textContent = 'Update Room';
        document.getElementById('roomId').value = id;
        document.getElementById('roomNumber').value = roomNumber;
        document.getElementById('roomName').value = name;
        document.getElementById('departmentId').value = deptId;
        document.getElementById('capacity').value = capacity;
        document.getElementById('equipment').value = equipment;
        document.getElementById('roomModal').classList.remove('hidden');
    }

    // Close modal
    function closeModal() {
        document.getElementById('roomModal').classList.add('hidden');
    }

    // View room schedule
    function viewRoomSchedule(roomNumber) {
        alert('View schedule for Room ' + roomNumber + ' - Feature to be implemented');
    }

    // Open delete confirmation
    function confirmDelete(id, roomNumber) {
        document.getElementById('deleteId').value = id;
        document.getElementById('deleteRoomNumber').textContent = roomNumber;
        document.getElementById('deleteModal').classList.remove('hidden');
    }

    // Close delete modal
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.add('hidden');
    }

    // Close modals on escape key
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            closeModal();
            closeDeleteModal();
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