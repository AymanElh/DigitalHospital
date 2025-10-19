sh <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
