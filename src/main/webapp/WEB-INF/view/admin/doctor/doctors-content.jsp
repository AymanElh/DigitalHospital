<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Page Header with Add Button -->
<div class="flex items-center justify-between mb-6">
    <div>
        <h2 class="text-2xl font-bold text-white mb-2">Doctors Management</h2>
        <p class="text-gray-400">Manage doctors, their specialties, and department assignments</p>
    </div>
    <button onclick="openCreateModal()"
            class="flex items-center space-x-2 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg transition">
        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
        </svg>
        <span>Add Doctor</span>
    </button>
</div>

<!-- Doctors Statistics -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
    <!-- TODO: Get statistics from servlet -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Total Doctors</p>
                <p class="text-3xl font-bold text-white">24</p>
            </div>
            <div class="bg-blue-600 p-3 rounded-lg">
                <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                </svg>
            </div>
        </div>
    </div>

    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Active Today</p>
                <p class="text-3xl font-bold text-white">18</p>
            </div>
            <div class="bg-green-600 p-3 rounded-lg">
                <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
        </div>
    </div>

    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">On Leave</p>
                <p class="text-3xl font-bold text-white">3</p>
            </div>
            <div class="bg-yellow-600 p-3 rounded-lg">
                <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
        </div>
    </div>

    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Specialties</p>
                <p class="text-3xl font-bold text-white">12</p>
            </div>
            <div class="bg-purple-600 p-3 rounded-lg">
                <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                </svg>
            </div>
        </div>
    </div>
</div>

<!-- Doctors Table -->
<div class="bg-gray-800 border border-gray-700 rounded-lg overflow-hidden">
    <!-- Table Header -->
    <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
        <h3 class="text-lg font-semibold text-white">All Doctors</h3>
        <!-- Filter and Search -->
        <div class="flex items-center space-x-3">
            <select class="bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="">All Departments</option>
                <option value="1">Cardiology</option>
                <option value="2">Neurology</option>
                <option value="3">Orthopedics</option>
                <option value="4">Pediatrics</option>
            </select>
            <div class="relative">
                <input type="text"
                       placeholder="Search doctors..."
                       class="bg-gray-700 text-white px-4 py-2 rounded-lg pl-10 focus:outline-none focus:ring-2 focus:ring-blue-500">
                <svg class="h-5 w-5 text-gray-400 absolute left-3 top-2.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
            </div>
        </div>
    </div>

    <!-- Table -->
    <div class="overflow-x-auto">
        <table class="w-full">
            <thead class="bg-gray-700">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Doctor</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Specialty</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Department</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Email</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Phone</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-right text-xs font-medium text-gray-300 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
                <!-- TODO: Loop through doctors list from servlet using <c:forEach var="doctor" items="${doctors}"> -->

                <!-- Sample Doctor Row 1 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                                JS
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Dr. John Smith</p>
                                <p class="text-xs text-gray-400">ID: DOC001</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Cardiologist</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Cardiology</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">john.smith@clinic.com</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">+1 234 567 8901</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewDoctorDetails(1)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(1, 'John', 'Smith', 'john.smith@clinic.com', '+1 234 567 8901', 'Cardiologist', 1)"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(1, 'Dr. John Smith')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Doctor Row 2 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center text-white font-semibold">
                                EJ
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Dr. Emily Johnson</p>
                                <p class="text-xs text-gray-400">ID: DOC002</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Neurologist</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Neurology</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">emily.j@clinic.com</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">+1 234 567 8902</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewDoctorDetails(2)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(2, 'Emily', 'Johnson', 'emily.j@clinic.com', '+1 234 567 8902', 'Neurologist', 2)"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(2, 'Dr. Emily Johnson')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Doctor Row 3 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                ML
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Dr. Michael Lee</p>
                                <p class="text-xs text-gray-400">ID: DOC003</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Orthopedic Surgeon</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Orthopedics</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">m.lee@clinic.com</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">+1 234 567 8903</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-yellow-600 text-white rounded-full">On Leave</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewDoctorDetails(3)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(3, 'Michael', 'Lee', 'm.lee@clinic.com', '+1 234 567 8903', 'Orthopedic Surgeon', 3)"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(3, 'Dr. Michael Lee')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Doctor Row 4 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-orange-600 flex items-center justify-center text-white font-semibold">
                                SW
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Dr. Sarah Williams</p>
                                <p class="text-xs text-gray-400">ID: DOC004</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Pediatrician</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Pediatrics</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">s.williams@clinic.com</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">+1 234 567 8904</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewDoctorDetails(4)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(4, 'Sarah', 'Williams', 's.williams@clinic.com', '+1 234 567 8904', 'Pediatrician', 4)"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(4, 'Dr. Sarah Williams')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Create/Edit Doctor Modal -->
<div id="doctorModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-2xl w-full border border-gray-700 max-h-screen overflow-y-auto">
        <!-- Modal Header -->
        <div class="flex items-center justify-between px-6 py-4 border-b border-gray-700 sticky top-0 bg-gray-800">
            <h3 id="modalTitle" class="text-lg font-bold text-white">Add New Doctor</h3>
            <button onclick="closeModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <!-- Modal Form -->
        <!-- TODO: Form action should point to servlet URL -->
        <form id="doctorForm" method="POST" action="#" class="px-6 py-4">
            <input type="hidden" id="doctorId" name="id" value="">
            <input type="hidden" id="formAction" name="action" value="create">

            <div class="grid grid-cols-2 gap-4 mb-4">
                <!-- First Name -->
                <div>
                    <label for="firstName" class="block text-sm font-medium text-gray-300 mb-2">
                        First Name *
                    </label>
                    <input type="text"
                           id="firstName"
                           name="firstName"
                           required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="John">
                </div>

                <!-- Last Name -->
                <div>
                    <label for="lastName" class="block text-sm font-medium text-gray-300 mb-2">
                        Last Name *
                    </label>
                    <input type="text"
                           id="lastName"
                           name="lastName"
                           required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="Smith">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4 mb-4">
                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-300 mb-2">
                        Email *
                    </label>
                    <input type="email"
                           id="email"
                           name="email"
                           required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="doctor@clinic.com">
                </div>

                <!-- Phone -->
                <div>
                    <label for="phone" class="block text-sm font-medium text-gray-300 mb-2">
                        Phone *
                    </label>
                    <input type="tel"
                           id="phone"
                           name="phone"
                           required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="+1 234 567 8900">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4 mb-4">
                <!-- Specialty -->
                <div>
                    <label for="specialty" class="block text-sm font-medium text-gray-300 mb-2">
                        Specialty *
                    </label>
                    <input type="text"
                           id="specialty"
                           name="specialty"
                           required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="e.g., Cardiologist">
                </div>

                <!-- Department -->
                <div>
                    <label for="departmentId" class="block text-sm font-medium text-gray-300 mb-2">
                        Department *
                    </label>
                    <!-- TODO: Populate departments from servlet ${departments} -->
                    <select id="departmentId"
                            name="departmentId"
                            required
                            class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="">Select Department</option>
                        <option value="1">Cardiology</option>
                        <option value="2">Neurology</option>
                        <option value="3">Orthopedics</option>
                        <option value="4">Pediatrics</option>
                    </select>
                </div>
            </div>

            <!-- Password (only for create) -->
            <div id="passwordSection" class="mb-6">
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
                            Password *
                        </label>
                        <input type="password"
                               id="password"
                               name="password"
                               class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               placeholder="********">
                    </div>
                    <div>
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-300 mb-2">
                            Confirm Password *
                        </label>
                        <input type="password"
                               id="confirmPassword"
                               name="confirmPassword"
                               class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               placeholder="********">
                    </div>
                </div>
            </div>

            <!-- Modal Actions -->
            <div class="flex justify-end space-x-3">
                <button type="button"
                        onclick="closeModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="submit"
                        class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                    <span id="submitButtonText">Create Doctor</span>
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
        <div class="px-6 py-4">
            <div class="flex items-center justify-center w-12 h-12 rounded-full bg-red-900 mx-auto mb-4">
                <svg class="h-6 w-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                </svg>
            </div>
            <h3 class="text-lg font-bold text-white text-center mb-2">Delete Doctor</h3>
            <p class="text-gray-400 text-center mb-6">
                Are you sure you want to delete <span id="deleteDoctorName" class="text-white font-semibold"></span>?
                This action cannot be undone and will affect all related appointments.
            </p>

            <!-- TODO: Form should submit to servlet -->
            <form id="deleteForm" method="POST" action="#">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" id="deleteId" name="id" value="">

                <div class="flex justify-center space-x-3">
                    <button type="button"
                            onclick="closeDeleteModal()"
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

<script>
    // Open create modal
    function openCreateModal() {
        document.getElementById('modalTitle').textContent = 'Add New Doctor';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitButtonText').textContent = 'Create Doctor';
        document.getElementById('doctorId').value = '';
        document.getElementById('firstName').value = '';
        document.getElementById('lastName').value = '';
        document.getElementById('email').value = '';
        document.getElementById('phone').value = '';
        document.getElementById('specialty').value = '';
        document.getElementById('departmentId').value = '';
        document.getElementById('password').value = '';
        document.getElementById('confirmPassword').value = '';
        document.getElementById('passwordSection').style.display = 'block';
        document.getElementById('password').required = true;
        document.getElementById('confirmPassword').required = true;
        document.getElementById('doctorModal').classList.remove('hidden');
    }

    // Open edit modal
    function openEditModal(id, firstName, lastName, email, phone, specialty, deptId) {
        document.getElementById('modalTitle').textContent = 'Edit Doctor';
        document.getElementById('formAction').value = 'update';
        document.getElementById('submitButtonText').textContent = 'Update Doctor';
        document.getElementById('doctorId').value = id;
        document.getElementById('firstName').value = firstName;
        document.getElementById('lastName').value = lastName;
        document.getElementById('email').value = email;
        document.getElementById('phone').value = phone;
        document.getElementById('specialty').value = specialty;
        document.getElementById('departmentId').value = deptId;
        document.getElementById('passwordSection').style.display = 'none';
        document.getElementById('password').required = false;
        document.getElementById('confirmPassword').required = false;
        document.getElementById('doctorModal').classList.remove('hidden');
    }

    // Close modal
    function closeModal() {
        document.getElementById('doctorModal').classList.add('hidden');
    }

    // View doctor details
    function viewDoctorDetails(id) {
        // TODO: Redirect to doctor details page or open details modal
        alert('View details for Doctor ID: ' + id + ' - Feature to be implemented');
    }

    // Open delete confirmation
    function confirmDelete(id, name) {
        document.getElementById('deleteId').value = id;
        document.getElementById('deleteDoctorName').textContent = name;
        document.getElementById('deleteModal').classList.remove('hidden');
    }

    // Close delete modal
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.add('hidden');
    }

    // Close modals on escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeModal();
            closeDeleteModal();
        }
    });
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- TODO: Set these attributes in the servlet before forwarding -->
<c:set var="pageTitle" value="Doctors Management" scope="request"/>
<c:set var="activePage" value="doctors" scope="request"/>
<c:set var="contentPage" value="/WEB-INF/view/admin/doctors-content.jsp" scope="request"/>

<jsp:include page="/WEB-INF/view/layout/admin-layout.jsp"/>

