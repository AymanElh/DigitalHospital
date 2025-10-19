<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- Doctor View Content -->
<div class="space-y-6">

    <!-- Back Button -->
    <div>
        <a href="${pageContext.request.contextPath}/admin/doctors"
           class="inline-flex items-center space-x-2 text-blue-400 hover:text-blue-300 transition">
            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
            </svg>
            <span>Back to Doctors List</span>
        </a>
    </div>

    <!-- Doctor Information Card -->
    <div class="bg-gray-800 rounded-lg border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
            <div class="flex items-center space-x-4">
                <!-- Small Profile Picture -->
                <div class="w-12 h-12 rounded-full bg-blue-600 flex items-center justify-center text-white text-lg font-bold">
                    <!-- TODO: Get from servlet - ${doctor.firstName.substring(0,1).toUpperCase()}${doctor.lastName.substring(0,1).toUpperCase()} -->
                    <c:choose>
                        <c:when test="${not empty doctor}">
                            ${doctor.firstName.substring(0,1).toUpperCase()}${doctor.lastName.substring(0,1).toUpperCase()}
                        </c:when>
                        <c:otherwise>JS</c:otherwise>
                    </c:choose>
                </div>
                <h2 class="text-xl font-semibold text-white">Doctor Information</h2>
            </div>
            <div class="flex items-center space-x-3">
                <!-- Delete Button -->
                <button onclick="confirmDelete(${doctor.id})"
                        class="inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition">
                    <svg class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                    </svg>
                    Delete Doctor
                </button>
            </div>
        </div>

        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

                <!-- Personal Information -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-sm font-semibold text-gray-400 uppercase tracking-wide">
                            Personal Information
                        </h3>
                        <!-- Edit Personal Info Button -->
                        <button onclick="openEditInfoModal()" type="button"
                           class="inline-flex items-center px-3 py-1 bg-blue-600 hover:bg-blue-700 text-white text-sm rounded transition">
                            <svg class="h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                            </svg>
                            Edit
                        </button>
                    </div>
                    <div class="space-y-3">
                        <div>
                            <label class="text-xs text-gray-400">First Name</label>
                            <p class="text-white font-medium mt-1">
                                <c:out value="${doctor.firstName}"/>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Last Name</label>
                            <p class="text-white font-medium mt-1">
                                <c:out value="${doctor.lastName}"/>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Email Address</label>
                            <p class="text-white font-medium mt-1 break-all">
                                <c:out value="${doctor.email}"/>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Phone</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.phone}">
                                        <c:out value="${doctor.phone}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">Not provided</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Speciality</label>
                            <p class="text-white font-medium mt-1">
                                <c:out value="${doctor.speciality}"/>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Department Assignment -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-sm font-semibold text-gray-400 uppercase tracking-wide">
                            Department Assignment
                        </h3>
                        <!-- Assign Department Button -->
                        <button onclick="openAssignDepartmentModal()" type="button"
                           class="inline-flex items-center px-3 py-1 bg-purple-600 hover:bg-purple-700 text-white text-sm rounded transition">
                            <svg class="h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                            </svg>
                            Assign
                        </button>
                    </div>
                    <div class="space-y-3">
                        <div>
                            <label class="text-xs text-gray-400">Department Name</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.departmentName}">
                                        <c:out value="${doctor.departmentName}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">Not assigned</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Department ID</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.departmentId}">
                                        #${doctor.departmentId}
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">Not assigned</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Total Consultations</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.consultationCount}">
                                        ${doctor.consultationCount}
                                    </c:when>
                                    <c:otherwise>0</c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <c:choose>
                            <c:when test="${not empty doctor.departmentName}">
                                <div class="pt-2">
                                    <span class="inline-block px-3 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                        <svg class="inline h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                        </svg>
                                        Assigned
                                    </span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="pt-2">
                                    <span class="inline-block px-3 py-1 text-xs rounded bg-yellow-900 text-yellow-300 border border-yellow-700">
                                        <svg class="inline h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                                        </svg>
                                        Not Assigned
                                    </span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Room Assignment -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-sm font-semibold text-gray-400 uppercase tracking-wide">
                            Room Assignment
                        </h3>
                        <!-- Attach Room Button -->
                        <button onclick="openAttachRoomModal()" type="button"
                           class="inline-flex items-center px-3 py-1 bg-green-600 hover:bg-green-700 text-white text-sm rounded transition">
                            <svg class="h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"/>
                            </svg>
                            Attach
                        </button>
                    </div>
                    <div class="space-y-3">
                        <div>
                            <label class="text-xs text-gray-400">Room Number</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.roomNumber}">
                                        Room ${doctor.roomNumber}
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">Not assigned</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Room ID</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.roomId}">
                                        #${doctor.roomId}
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">Not assigned</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400">Doctor ID</label>
                            <p class="text-white font-medium mt-1">
                                <c:choose>
                                    <c:when test="${not empty doctor.id}">
                                        #${doctor.id}
                                    </c:when>
                                    <c:otherwise>#N/A</c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <c:choose>
                            <c:when test="${not empty doctor.roomNumber}">
                                <div class="pt-2">
                                    <span class="inline-block px-3 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                        <svg class="inline h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                        </svg>
                                        Attached
                                    </span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="pt-2">
                                    <span class="inline-block px-3 py-1 text-xs rounded bg-yellow-900 text-yellow-300 border border-yellow-700">
                                        <svg class="inline h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                                        </svg>
                                        Not Attached
                                    </span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Schedule Management Section -->
    <div class="bg-gray-800 rounded-lg border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
            <div>
                <h2 class="text-xl font-semibold text-white">Schedule Management</h2>
                <p class="text-sm text-gray-400 mt-1">Generate consultation time slots for the doctor's working days</p>
            </div>
            <!-- View Schedule Button -->
            <a href="${pageContext.request.contextPath}/admin/doctors/${doctor.id}/schedule"
               class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                <svg class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                </svg>
                View Schedule
            </a>
        </div>

        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Schedule Information -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <h3 class="text-sm font-semibold text-gray-400 uppercase tracking-wide mb-4">Working Hours</h3>
                    <div class="space-y-3">
                        <div class="flex items-center justify-between">
                            <span class="text-gray-400">Start Time:</span>
                            <span class="text-white font-medium">9:00 AM</span>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-gray-400">End Time:</span>
                            <span class="text-white font-medium">5:00 PM</span>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-gray-400">Lunch Break:</span>
                            <span class="text-white font-medium">12:00 PM - 1:00 PM</span>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-gray-400">Slot Duration:</span>
                            <span class="text-white font-medium">30 minutes</span>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-gray-400">Working Days:</span>
                            <span class="text-white font-medium">Monday - Friday</span>
                        </div>
                    </div>
                </div>

                <!-- Generate Slots Card -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <h3 class="text-sm font-semibold text-gray-400 uppercase tracking-wide mb-4">Generate Slots</h3>
                    <div class="space-y-4">
                        <div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-lg p-3">
                            <div class="flex items-start space-x-2">
                                <svg class="h-5 w-5 text-blue-400 flex-shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                                <div class="text-sm text-blue-300">
                                    <p class="font-medium mb-1">Requirements:</p>
                                    <ul class="list-disc list-inside space-y-1 text-xs">
                                        <li>Doctor must be assigned to a department</li>
                                        <li>Doctor must have a room attached</li>
                                        <li>Slots will be generated for weekdays only</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${not empty doctor.roomId and not empty doctor.departmentId}">
                                <button type="button" onclick="openGenerateSlotsModal()"
                                        class="w-full inline-flex items-center justify-center px-6 py-3 bg-green-600 hover:bg-green-700 text-white rounded-lg transition">
                                    <svg class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                    </svg>
                                    Generate Working Slots
                                </button>
                            </c:when>
                            <c:otherwise>
                                <div class="bg-yellow-900 bg-opacity-30 border border-yellow-700 rounded-lg p-3">
                                    <div class="flex items-start space-x-2">
                                        <svg class="h-5 w-5 text-yellow-400 flex-shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                                        </svg>
                                        <p class="text-sm text-yellow-300">
                                            Please assign a department and attach a room before generating slots.
                                        </p>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Consultations Statistics -->
    <div class="bg-gray-800 rounded-lg border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700">
            <h2 class="text-xl font-semibold text-white">Consultation Statistics</h2>
        </div>

        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <!-- Total Consultations -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-2">
                        <div class="bg-blue-900 p-2 rounded">
                            <svg class="h-5 w-5 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                            </svg>
                        </div>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">Total Consultations</p>
                    <!-- TODO: Get from servlet - ${doctor.consultationList.size()} -->
                    <p class="text-2xl font-bold text-white">
                        <c:choose>
                            <c:when test="${not empty doctor and not empty doctor.consultationList}">
                                ${doctor.consultationList.size()}
                            </c:when>
                            <c:otherwise>24</c:otherwise>
                        </c:choose>
                    </p>
                </div>

                <!-- Completed -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-2">
                        <div class="bg-green-900 p-2 rounded">
                            <svg class="h-5 w-5 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">Completed</p>
                    <!-- TODO: Get from servlet - count consultations with status COMPLETED -->
                    <p class="text-2xl font-bold text-white">18</p>
                </div>

                <!-- Validated -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-2">
                        <div class="bg-blue-900 p-2 rounded">
                            <svg class="h-5 w-5 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M5 13l4 4L19 7"/>
                            </svg>
                        </div>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">Validated</p>
                    <!-- TODO: Get from servlet - count consultations with status VALIDATED -->
                    <p class="text-2xl font-bold text-white">4</p>
                </div>

                <!-- Pending -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <div class="flex items-center justify-between mb-2">
                        <div class="bg-yellow-900 p-2 rounded">
                            <svg class="h-5 w-5 text-yellow-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                    <p class="text-sm text-gray-400 mb-1">Reserved</p>
                    <!-- TODO: Get from servlet - count consultations with status RESERVED -->
                    <p class="text-2xl font-bold text-white">2</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Consultations -->
    <div class="bg-gray-800 rounded-lg border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
            <h2 class="text-xl font-semibold text-white">Recent Consultations</h2>
            <a href="${pageContext.request.contextPath}/admin/consultations?doctorId=${doctor.id}"
               class="text-sm text-blue-400 hover:text-blue-300 transition">
                View All →
            </a>
        </div>

        <div class="p-6">
            <!-- TODO: Loop through recent consultations from servlet -->

            <!-- Empty State -->
            <c:choose>
                <c:when test="${empty doctor.consultationList or doctor.consultationList.size() == 0}">
                    <div class="text-center py-8">
                        <svg class="mx-auto h-12 w-12 text-gray-600 mb-4" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <p class="text-gray-400">No consultations found for this doctor</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Consultation Table -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-700">
                            <thead>
                            <tr class="text-left text-xs text-gray-400 uppercase tracking-wider">
                                <th class="px-4 py-3">Patient</th>
                                <th class="px-4 py-3">Date</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3">Report</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-700">
                            <!-- Static Data - Replace with forEach loop -->
                            <tr class="hover:bg-gray-700 transition">
                                <td class="px-4 py-4">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-8 h-8 rounded-full bg-purple-600 flex items-center justify-center text-white text-sm font-semibold">
                                            AM
                                        </div>
                                        <div>
                                            <p class="text-white font-medium">Alice Morrison</p>
                                            <p class="text-sm text-gray-400">alice.m@email.com</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-4 text-gray-300">18/10/2025 10:30</td>
                                <td class="px-4 py-4">
                                    <span class="inline-block px-2 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                        Completed
                                    </span>
                                </td>
                                <td class="px-4 py-4 text-gray-300 max-w-xs truncate">
                                    ECG performed. Prescribed medication...
                                </td>
                            </tr>
                            <tr class="hover:bg-gray-700 transition">
                                <td class="px-4 py-4">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-8 h-8 rounded-full bg-purple-600 flex items-center justify-center text-white text-sm font-semibold">
                                            RJ
                                        </div>
                                        <div>
                                            <p class="text-white font-medium">Robert Johnson</p>
                                            <p class="text-sm text-gray-400">robert.j@email.com</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-4 text-gray-300">17/10/2025 14:15</td>
                                <td class="px-4 py-4">
                                    <span class="inline-block px-2 py-1 text-xs rounded bg-blue-900 text-blue-300 border border-blue-700">
                                        Validated
                                    </span>
                                </td>
                                <td class="px-4 py-4 text-gray-300 max-w-xs truncate">
                                    Routine checkup. Blood pressure normal...
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

<!-- Edit Personal Info Modal -->
<div id="editInfoModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-2xl w-full border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700">
            <h3 class="text-xl font-bold text-white">Edit Personal Information</h3>
        </div>
        <form method="POST" action="${pageContext.request.contextPath}/admin/doctors/edit-info">
            <input type="hidden" name="id" value="${doctor.id}">

            <div class="px-6 py-4 space-y-4">
                <!-- First Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">First Name</label>
                    <input type="text" name="firstName" value="${doctor.firstName}" required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Last Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Last Name</label>
                    <input type="text" name="lastName" value="${doctor.lastName}" required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Email -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Email Address</label>
                    <input type="email" name="email" value="${doctor.email}" required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Phone -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Phone Number</label>
                    <input type="text" name="phone" value="${doctor.phone}"
                           placeholder="0612345678"
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <!-- Speciality -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Speciality</label>
                    <input type="text" name="speciality" value="${doctor.speciality}" required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
            </div>

            <div class="px-6 py-4 border-t border-gray-700 flex justify-end space-x-3">
                <button type="button" onclick="closeEditInfoModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="submit"
                        class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                    Save Changes
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Assign Department Modal -->
<div id="assignDepartmentModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700">
            <h3 class="text-xl font-bold text-white">Assign Department</h3>
        </div>
        <form method="POST" action="${pageContext.request.contextPath}/admin/doctors/assign-department">
            <input type="hidden" name="doctorId" value="${doctor.id}">

            <div class="px-6 py-4 space-y-4">
                <!-- Current Department Info -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <p class="text-xs text-gray-400 mb-1">Current Department</p>
                    <p class="text-white font-medium">
                        <c:choose>
                            <c:when test="${not empty doctor.departmentName}">
                                ${doctor.departmentName}
                            </c:when>
                            <c:otherwise>
                                <span class="text-gray-500">Not assigned</span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>

                <!-- Department Selection -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Select Department</label>
                    <select name="departmentId" required
                            class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500">
                        <option value="">-- Select Department --</option>
                        <!-- TODO: Get departments from servlet -->
                        <c:forEach items="${departments}" var="dept">
                            <option value="${dept.id}" ${dept.id == doctor.departmentId ? 'selected' : ''}>
                                ${dept.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="px-6 py-4 border-t border-gray-700 flex justify-end space-x-3">
                <button type="button" onclick="closeAssignDepartmentModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="submit"
                        class="px-6 py-2 bg-purple-600 hover:bg-purple-700 text-white rounded-lg transition">
                    Assign Department
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Attach Room Modal -->
<div id="attachRoomModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700">
            <h3 class="text-xl font-bold text-white">Attach Room</h3>
        </div>
        <form method="POST" action="${pageContext.request.contextPath}/admin/doctors/attach-room">
            <input type="hidden" name="doctorId" value="${doctor.id}">

            <div class="px-6 py-4 space-y-4">
                <!-- Current Room Info -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <p class="text-xs text-gray-400 mb-1">Current Room</p>
                    <p class="text-white font-medium">
                        <c:choose>
                            <c:when test="${not empty doctor.roomNumber}">
                                Room ${doctor.roomNumber}
                            </c:when>
                            <c:otherwise>
                                <span class="text-gray-500">Not attached</span>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>

                <!-- Room Selection -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Select Room</label>
                    <select name="roomId" required
                            class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <option value="">-- Select Room --</option>
                        <!-- TODO: Get available rooms from servlet -->
                        <c:forEach items="${rooms}" var="room">
                            <option value="${room.id}" ${room.id == doctor.roomId ? 'selected' : ''}>
                                Room ${room.roomNumber}
                                <c:if test="${room.isAvailable}"> - Available</c:if>
                                <c:if test="${!room.isAvailable}"> - Occupied</c:if>
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Info Message -->
                <div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-lg p-3">
                    <div class="flex items-start space-x-2">
                        <svg class="h-5 w-5 text-blue-400 flex-shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        <p class="text-sm text-blue-300">Only available rooms or the current assigned room are shown.</p>
                    </div>
                </div>
            </div>

            <div class="px-6 py-4 border-t border-gray-700 flex justify-end space-x-3">
                <button type="button" onclick="closeAttachRoomModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="submit"
                        class="px-6 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition">
                    Attach Room
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Generate Slots Modal -->
<div id="generateSlotsModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700">
            <h3 class="text-xl font-bold text-white">Generate Working Slots</h3>
            <p class="text-sm text-gray-400 mt-1">Create consultation time slots for the selected date range</p>
        </div>
        <form method="POST" action="${pageContext.request.contextPath}/admin/doctors/generate-slots">
            <input type="hidden" name="doctorId" value="${doctor.id}">

            <div class="px-6 py-4 space-y-4">
                <!-- Info Message -->
                <div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-lg p-3">
                    <div class="flex items-start space-x-2">
                        <svg class="h-5 w-5 text-blue-400 flex-shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        <div class="text-sm text-blue-300">
                            <p class="font-medium mb-1">Auto-generated schedule:</p>
                            <ul class="list-disc list-inside space-y-1 text-xs">
                                <li>9:00 AM - 5:00 PM (weekdays only)</li>
                                <li>30-minute slots with lunch break 12-1 PM</li>
                                <li>Slots will be created for the date range you select</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Start Date -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">Start Date</label>
                    <input type="date" name="startDate" required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    <p class="text-xs text-gray-400 mt-1">First day to generate slots</p>
                </div>

                <!-- End Date -->
                <div>
                    <label class="block text-sm font-medium text-gray-300 mb-2">End Date</label>
                    <input type="date" name="endDate" required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    <p class="text-xs text-gray-400 mt-1">Last day to generate slots</p>
                </div>

                <!-- Doctor Info Summary -->
                <div class="bg-gray-900 rounded-lg p-4 border border-gray-700">
                    <p class="text-xs text-gray-400 mb-2">Doctor Information</p>
                    <div class="space-y-1 text-sm">
                        <div class="flex justify-between">
                            <span class="text-gray-400">Room:</span>
                            <span class="text-white font-medium">Room ${doctor.roomNumber}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-gray-400">Department:</span>
                            <span class="text-white font-medium">${doctor.departmentName}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="px-6 py-4 border-t border-gray-700 flex justify-end space-x-3">
                <button type="button" onclick="closeGenerateSlotsModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="submit"
                        class="px-6 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition">
                    Generate Slots
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Edit Personal Info Modal
    function openEditInfoModal() {
        document.getElementById('editInfoModal').classList.remove('hidden');
    }

    function closeEditInfoModal() {
        document.getElementById('editInfoModal').classList.add('hidden');
    }

    // Assign Department Modal
    function openAssignDepartmentModal() {
        document.getElementById('assignDepartmentModal').classList.remove('hidden');
    }

    function closeAssignDepartmentModal() {
        document.getElementById('assignDepartmentModal').classList.add('hidden');
    }

    // Attach Room Modal
    function openAttachRoomModal() {
        document.getElementById('attachRoomModal').classList.remove('hidden');
    }

    function closeAttachRoomModal() {
        document.getElementById('attachRoomModal').classList.add('hidden');
    }

    // Generate Slots Modal
    function openGenerateSlotsModal() {
        document.getElementById('generateSlotsModal').classList.remove('hidden');
    }

    function closeGenerateSlotsModal() {
        document.getElementById('generateSlotsModal').classList.add('hidden');
    }

    // Delete confirmation
    function confirmDelete(id) {
        if (confirm('Are you sure you want to delete this doctor? This action cannot be undone.')) {
            window.location.href = '${pageContext.request.contextPath}/admin/doctors/delete?id=' + id;
        }
    }

    // Close modals on escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeEditInfoModal();
            closeAssignDepartmentModal();
            closeAttachRoomModal();
            closeGenerateSlotsModal();
        }
    });

    // Close modals when clicking outside
    document.querySelectorAll('#editInfoModal, #assignDepartmentModal, #attachRoomModal').forEach(modal => {
        modal.addEventListener('click', function(event) {
            if (event.target === this) {
                this.classList.add('hidden');
            }
        });
    });
</script>
