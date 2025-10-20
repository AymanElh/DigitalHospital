<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Dashboard Statistics Cards -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

    <!-- Today's Appointments -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Today's Appointments</p>
                <p class="text-3xl font-bold text-white">8</p>
                <p class="text-xs text-blue-500 mt-2">3 pending, 5 confirmed</p>
            </div>
            <div class="bg-blue-600 p-4 rounded-lg">
                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
            </div>
        </div>
    </div>

    <!-- Completed Today -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Completed Today</p>
                <p class="text-3xl font-bold text-white">5</p>
                <p class="text-xs text-green-500 mt-2">↑ 25% from yesterday</p>
            </div>
            <div class="bg-green-600 p-4 rounded-lg">
                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
        </div>
    </div>

    <!-- Total Patients -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">My Patients</p>
                <p class="text-3xl font-bold text-white">147</p>
                <p class="text-xs text-blue-500 mt-2">12 new this month</p>
            </div>
            <div class="bg-purple-600 p-4 rounded-lg">
                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                </svg>
            </div>
        </div>
    </div>

    <!-- Pending Approvals -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Pending Approvals</p>
                <p class="text-3xl font-bold text-white">12</p>
                <p class="text-xs text-yellow-500 mt-2">Requires attention</p>
            </div>
            <div class="bg-orange-600 p-4 rounded-lg">
                <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
        </div>
    </div>
</div>

<!-- Today's Schedule and Recent Activity -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">

    <!-- Today's Schedule -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between mb-4">
            <h2 class="text-lg font-bold text-white">Today's Schedule</h2>
            <span class="text-sm text-blue-400">October 19, 2025</span>
        </div>

        <div class="space-y-3">
            <!-- Appointment 1 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg border-l-4 border-blue-600">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                        JD
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">John Doe</p>
                        <p class="text-xs text-gray-400">09:00 - 09:30 • Room 201</p>
                        <p class="text-xs text-blue-400">Routine Checkup</p>
                    </div>
                </div>
                <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Confirmed</span>
            </div>

            <!-- Appointment 2 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg border-l-4 border-yellow-600">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center text-white font-semibold">
                        SA
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">Sarah Anderson</p>
                        <p class="text-xs text-gray-400">10:00 - 10:30 • Room 201</p>
                        <p class="text-xs text-yellow-400">Follow-up consultation</p>
                    </div>
                </div>
                <span class="px-3 py-1 text-xs font-medium bg-yellow-600 text-white rounded-full">Pending</span>
            </div>

            <!-- Appointment 3 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg border-l-4 border-blue-600">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                        MB
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">Michael Brown</p>
                        <p class="text-xs text-gray-400">11:00 - 11:30 • Room 201</p>
                        <p class="text-xs text-blue-400">Blood pressure monitoring</p>
                    </div>
                </div>
                <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Confirmed</span>
            </div>

            <!-- Lunch Break -->
            <div class="flex items-center justify-center p-3 bg-yellow-900 bg-opacity-30 border border-yellow-600 rounded-lg">
                <div class="text-center">
                    <p class="text-sm font-medium text-yellow-400">🍽️ Lunch Break</p>
                    <p class="text-xs text-yellow-300">12:00 - 13:00</p>
                </div>
            </div>

            <!-- Appointment 4 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg border-l-4 border-yellow-600">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-red-600 flex items-center justify-center text-white font-semibold">
                        EW
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">Emily Wilson</p>
                        <p class="text-xs text-gray-400">14:00 - 14:30 • Room 201</p>
                        <p class="text-xs text-yellow-400">Chest pain evaluation</p>
                    </div>
                </div>
                <span class="px-3 py-1 text-xs font-medium bg-yellow-600 text-white rounded-full">Pending</span>
            </div>
        </div>

        <div class="mt-4 pt-4 border-t border-gray-700">
            <a href="${pageContext.request.contextPath}/doctor/schedule"
               class="text-sm text-blue-500 hover:text-blue-400">View Full Schedule →</a>
        </div>
    </div>

    <!-- Pending Approvals -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between mb-4">
            <h2 class="text-lg font-bold text-white">Pending Approvals</h2>
            <a href="${pageContext.request.contextPath}/doctor/consultations"
               class="text-sm text-blue-500 hover:text-blue-400">View All</a>
        </div>

        <div class="space-y-3">
            <!-- Pending Request 1 -->
            <div class="p-4 bg-gray-700 rounded-lg border border-orange-600">
                <div class="flex items-start justify-between">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 rounded-full bg-orange-600 flex items-center justify-center text-white font-semibold">
                            RM
                        </div>
                        <div>
                            <p class="text-sm font-medium text-white">Robert Miller</p>
                            <p class="text-xs text-gray-400">Requested: Tomorrow at 15:30</p>
                            <p class="text-xs text-orange-400">Diabetes consultation</p>
                        </div>
                    </div>
                    <div class="flex space-x-2">
                        <button class="px-3 py-1 text-xs bg-green-600 hover:bg-green-700 text-white rounded transition">
                            Approve
                        </button>
                        <button class="px-3 py-1 text-xs bg-red-600 hover:bg-red-700 text-white rounded transition">
                            Decline
                        </button>
                    </div>
                </div>
            </div>

            <!-- Pending Request 2 -->
            <div class="p-4 bg-gray-700 rounded-lg border border-orange-600">
                <div class="flex items-start justify-between">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 rounded-full bg-pink-600 flex items-center justify-center text-white font-semibold">
                            LG
                        </div>
                        <div>
                            <p class="text-sm font-medium text-white">Lisa Garcia</p>
                            <p class="text-xs text-gray-400">Requested: Oct 21 at 10:00</p>
                            <p class="text-xs text-orange-400">Annual physical exam</p>
                        </div>
                    </div>
                    <div class="flex space-x-2">
                        <button class="px-3 py-1 text-xs bg-green-600 hover:bg-green-700 text-white rounded transition">
                            Approve
                        </button>
                        <button class="px-3 py-1 text-xs bg-red-600 hover:bg-red-700 text-white rounded transition">
                            Decline
                        </button>
                    </div>
                </div>
            </div>

            <!-- Pending Request 3 -->
            <div class="p-4 bg-gray-700 rounded-lg border border-orange-600">
                <div class="flex items-start justify-between">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 rounded-full bg-indigo-600 flex items-center justify-center text-white font-semibold">
                            DT
                        </div>
                        <div>
                            <p class="text-sm font-medium text-white">David Thompson</p>
                            <p class="text-xs text-gray-400">Requested: Oct 22 at 14:30</p>
                            <p class="text-xs text-orange-400">Back pain consultation</p>
                        </div>
                    </div>
                    <div class="flex space-x-2">
                        <button class="px-3 py-1 text-xs bg-green-600 hover:bg-green-700 text-white rounded transition">
                            Approve
                        </button>
                        <button class="px-3 py-1 text-xs bg-red-600 hover:bg-red-700 text-white rounded transition">
                            Decline
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Recent Patients and Quick Actions -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

    <!-- Recent Patients -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between mb-4">
            <h2 class="text-lg font-bold text-white">Recent Patients</h2>
            <a href="${pageContext.request.contextPath}/doctor/patients"
               class="text-sm text-blue-500 hover:text-blue-400">View All</a>
        </div>

        <div class="space-y-3">
            <!-- Patient 1 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                        AJ
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">Anna Johnson</p>
                        <p class="text-xs text-gray-400">Last visit: Oct 15, 2025</p>
                        <p class="text-xs text-blue-400">Hypertension follow-up</p>
                    </div>
                </div>
                <button class="text-sm text-blue-500 hover:text-blue-400">View Record</button>
            </div>

            <!-- Patient 2 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center text-white font-semibold">
                        TC
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">Thomas Chen</p>
                        <p class="text-xs text-gray-400">Last visit: Oct 14, 2025</p>
                        <p class="text-xs text-green-400">Routine checkup - Normal</p>
                    </div>
                </div>
                <button class="text-sm text-blue-500 hover:text-blue-400">View Record</button>
            </div>

            <!-- Patient 3 -->
            <div class="flex items-center justify-between p-3 bg-gray-700 rounded-lg">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                        MP
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">Maria Perez</p>
                        <p class="text-xs text-gray-400">Last visit: Oct 13, 2025</p>
                        <p class="text-xs text-yellow-400">Diabetes monitoring</p>
                    </div>
                </div>
                <button class="text-sm text-blue-500 hover:text-blue-400">View Record</button>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <h2 class="text-lg font-bold text-white mb-4">Quick Actions</h2>

        <div class="grid grid-cols-2 gap-4">
            <!-- Add Medical Report -->
            <button class="bg-blue-600 hover:bg-blue-700 rounded-lg p-4 text-center transition">
                <svg class="h-8 w-8 text-white mx-auto mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <p class="text-sm font-medium text-white">Add Report</p>
            </button>

            <!-- View Schedule -->
            <button class="bg-green-600 hover:bg-green-700 rounded-lg p-4 text-center transition">
                <svg class="h-8 w-8 text-white mx-auto mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
                <p class="text-sm font-medium text-white">My Schedule</p>
            </button>

            <!-- Patient Search -->
            <button class="bg-purple-600 hover:bg-purple-700 rounded-lg p-4 text-center transition">
                <svg class="h-8 w-8 text-white mx-auto mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
                <p class="text-sm font-medium text-white">Find Patient</p>
            </button>

            <!-- Emergency Notes -->
            <button class="bg-red-600 hover:bg-red-700 rounded-lg p-4 text-center transition">
                <svg class="h-8 w-8 text-white mx-auto mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.996-.833-2.464 0L3.34 16.5c-.77.833.192 2.5 1.732 2.5z" />
                </svg>
                <p class="text-sm font-medium text-white">Emergency</p>
            </button>
        </div>

        <!-- Profile Quick Info -->
        <div class="mt-6 pt-4 border-t border-gray-700">
            <div class="bg-gray-700 rounded-lg p-4">
                <div class="flex items-center space-x-3">
                    <div class="w-12 h-12 rounded-full bg-blue-600 flex items-center justify-center text-white font-bold text-lg">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                            </c:when>
                            <c:otherwise>DR</c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <p class="text-sm font-medium text-white">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    Dr. ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                                </c:when>
                                <c:otherwise>Dr. John Smith</c:otherwise>
                            </c:choose>
                        </p>
                        <p class="text-xs text-gray-400">Cardiology Department</p>
                        <p class="text-xs text-blue-400">Room 201 • Available</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
