<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Page Header -->
<div class="flex items-center justify-between mb-6">
    <div>
        <h2 class="text-2xl font-bold text-white mb-2">Consultations Management</h2>
        <p class="text-gray-400">Monitor and manage all consultations across the clinic</p>
    </div>
    <div class="flex items-center space-x-3">
        <!-- Export Button -->
        <button onclick="exportConsultations()"
                class="flex items-center space-x-2 bg-gray-700 hover:bg-gray-600 text-white px-6 py-3 rounded-lg transition">
            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <span>Export</span>
        </button>
    </div>
</div>

<!-- Consultation Statistics -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
    <!-- TODO: Get statistics from servlet -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Total Today</p>
                <p class="text-3xl font-bold text-white">42</p>
            </div>
            <div class="bg-blue-600 p-3 rounded-lg">
                <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                </svg>
            </div>
        </div>
    </div>

    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm text-gray-400 mb-1">Pending</p>
                <p class="text-3xl font-bold text-white">18</p>
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
                <p class="text-sm text-gray-400 mb-1">Confirmed</p>
                <p class="text-3xl font-bold text-white">16</p>
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
                <p class="text-sm text-gray-400 mb-1">Completed</p>
                <p class="text-3xl font-bold text-white">8</p>
            </div>
            <div class="bg-purple-600 p-3 rounded-lg">
                <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
            </div>
        </div>
    </div>
</div>

<!-- Filters and Search -->
<div class="bg-gray-800 border border-gray-700 rounded-lg p-4 mb-6">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <!-- Date Filter -->
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-2">Date</label>
            <input type="date"
                   class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <!-- Status Filter -->
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-2">Status</label>
            <select class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="">All Status</option>
                <option value="RESERVED">Reserved</option>
                <option value="CONFIRMED">Confirmed</option>
                <option value="COMPLETED">Completed</option>
                <option value="CANCELLED">Cancelled</option>
            </select>
        </div>

        <!-- Department Filter -->
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-2">Department</label>
            <select class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="">All Departments</option>
                <option value="1">Cardiology</option>
                <option value="2">Neurology</option>
                <option value="3">Orthopedics</option>
                <option value="4">Pediatrics</option>
            </select>
        </div>

        <!-- Search -->
        <div>
            <label class="block text-sm font-medium text-gray-300 mb-2">Search</label>
            <div class="relative">
                <input type="text"
                       placeholder="Patient or doctor..."
                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg pl-10 focus:outline-none focus:ring-2 focus:ring-blue-500">
                <svg class="h-5 w-5 text-gray-400 absolute left-3 top-2.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
            </div>
        </div>
    </div>
</div>

<!-- Consultations Table -->
<div class="bg-gray-800 border border-gray-700 rounded-lg overflow-hidden">
    <!-- Table Header -->
    <div class="px-6 py-4 border-b border-gray-700">
        <h3 class="text-lg font-semibold text-white">All Consultations</h3>
    </div>

    <!-- Table -->
    <div class="overflow-x-auto">
        <table class="w-full">
            <thead class="bg-gray-700">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Patient</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Doctor</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Date & Time</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Room</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-right text-xs font-medium text-gray-300 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
                <!-- TODO: Loop through consultations list from servlet using <c:forEach var="consultation" items="${consultations}"> -->

                <!-- Sample Consultation Row 1 - Reserved -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">#CON001</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                                JD
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">John Doe</p>
                                <p class="text-xs text-gray-400">john.doe@email.com</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Dr. John Smith</p>
                            <p class="text-xs text-gray-400">Cardiology</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Oct 15, 2025</p>
                            <p class="text-xs text-gray-400">10:30 AM</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Room 101</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-yellow-600 text-white rounded-full">Reserved</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewConsultationDetails(1)"
                                class="text-purple-500 hover:text-purple-400 mr-2 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="updateStatus(1, 'CONFIRMED')"
                                class="text-green-500 hover:text-green-400 mr-2 transition" title="Confirm">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </button>
                        <button onclick="updateStatus(1, 'CANCELLED')"
                                class="text-red-500 hover:text-red-400 transition" title="Cancel">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Consultation Row 2 - Confirmed -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">#CON002</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center text-white font-semibold">
                                SA
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Sarah Anderson</p>
                                <p class="text-xs text-gray-400">sarah.a@email.com</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Dr. Emily Johnson</p>
                            <p class="text-xs text-gray-400">Neurology</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Oct 15, 2025</p>
                            <p class="text-xs text-gray-400">11:00 AM</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Room 102</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-blue-600 text-white rounded-full">Confirmed</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewConsultationDetails(2)"
                                class="text-purple-500 hover:text-purple-400 mr-2 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="updateStatus(2, 'COMPLETED')"
                                class="text-green-500 hover:text-green-400 mr-2 transition" title="Mark Completed">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                            </svg>
                        </button>
                        <button onclick="updateStatus(2, 'CANCELLED')"
                                class="text-red-500 hover:text-red-400 transition" title="Cancel">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Consultation Row 3 - Completed -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">#CON003</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                MB
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Michael Brown</p>
                                <p class="text-xs text-gray-400">m.brown@email.com</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Dr. Michael Lee</p>
                            <p class="text-xs text-gray-400">Orthopedics</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Oct 15, 2025</p>
                            <p class="text-xs text-gray-400">09:00 AM</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Room 201</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Completed</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewConsultationDetails(3)"
                                class="text-purple-500 hover:text-purple-400 mr-2 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                        <button onclick="viewMedicalReport(3)"
                                class="text-blue-500 hover:text-blue-400 transition" title="Medical Report">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Consultation Row 4 - Cancelled -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">#CON004</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 rounded-full bg-orange-600 flex items-center justify-center text-white font-semibold">
                                LM
                            </div>
                            <div>
                                <p class="text-sm font-medium text-white">Lisa Martinez</p>
                                <p class="text-xs text-gray-400">lisa.m@email.com</p>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Dr. Sarah Williams</p>
                            <p class="text-xs text-gray-400">Pediatrics</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div>
                            <p class="text-sm text-white">Oct 15, 2025</p>
                            <p class="text-xs text-gray-400">02:00 PM</p>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">Room 103</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-red-600 text-white rounded-full">Cancelled</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewConsultationDetails(4)"
                                class="text-purple-500 hover:text-purple-400 transition" title="View Details">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <div class="px-6 py-4 border-t border-gray-700 flex items-center justify-between">
        <div class="text-sm text-gray-400">
            Showing <span class="font-semibold text-white">1</span> to <span class="font-semibold text-white">4</span> of <span class="font-semibold text-white">42</span> results
        </div>
        <div class="flex space-x-2">
            <button class="px-3 py-1 bg-gray-700 hover:bg-gray-600 text-white rounded transition">Previous</button>
            <button class="px-3 py-1 bg-blue-600 text-white rounded">1</button>
            <button class="px-3 py-1 bg-gray-700 hover:bg-gray-600 text-white rounded transition">2</button>
            <button class="px-3 py-1 bg-gray-700 hover:bg-gray-600 text-white rounded transition">3</button>
            <button class="px-3 py-1 bg-gray-700 hover:bg-gray-600 text-white rounded transition">Next</button>
        </div>
    </div>
</div>

<!-- Consultation Details Modal -->
<div id="detailsModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-2xl w-full border border-gray-700 max-h-screen overflow-y-auto">
        <!-- Modal Header -->
        <div class="flex items-center justify-between px-6 py-4 border-b border-gray-700 sticky top-0 bg-gray-800">
            <h3 class="text-lg font-bold text-white">Consultation Details</h3>
            <button onclick="closeDetailsModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <!-- Modal Content -->
        <div class="px-6 py-4">
            <!-- TODO: Populate with actual consultation data from servlet -->
            <div class="space-y-4">
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <p class="text-sm text-gray-400">Consultation ID</p>
                        <p class="text-white font-medium">#CON001</p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-400">Status</p>
                        <span class="px-3 py-1 text-xs font-medium bg-yellow-600 text-white rounded-full">Reserved</span>
                    </div>
                </div>

                <div class="border-t border-gray-700 pt-4">
                    <h4 class="text-white font-semibold mb-3">Patient Information</h4>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-sm text-gray-400">Name</p>
                            <p class="text-white">John Doe</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-400">Email</p>
                            <p class="text-white">john.doe@email.com</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-400">Phone</p>
                            <p class="text-white">+1 234 567 8900</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-400">Date of Birth</p>
                            <p class="text-white">Jan 15, 1985</p>
                        </div>
                    </div>
                </div>

                <div class="border-t border-gray-700 pt-4">
                    <h4 class="text-white font-semibold mb-3">Doctor & Schedule</h4>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-sm text-gray-400">Doctor</p>
                            <p class="text-white">Dr. John Smith</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-400">Department</p>
                            <p class="text-white">Cardiology</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-400">Date & Time</p>
                            <p class="text-white">Oct 15, 2025 - 10:30 AM</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-400">Room</p>
                            <p class="text-white">Room 101</p>
                        </div>
                    </div>
                </div>

                <div class="border-t border-gray-700 pt-4">
                    <h4 class="text-white font-semibold mb-3">Medical Notes</h4>
                    <p class="text-gray-400 text-sm">Regular checkup for heart condition monitoring.</p>
                </div>
            </div>

            <!-- Modal Actions -->
            <div class="flex justify-end space-x-3 mt-6 pt-4 border-t border-gray-700">
                <button onclick="closeDetailsModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    // View consultation details
    function viewConsultationDetails(id) {
        // TODO: Load consultation data and populate modal
        document.getElementById('detailsModal').classList.remove('hidden');
    }

    // Close details modal
    function closeDetailsModal() {
        document.getElementById('detailsModal').classList.add('hidden');
    }

    // Update consultation status
    function updateStatus(id, status) {
        // TODO: Submit status update to servlet
        if (confirm('Are you sure you want to update this consultation status to ' + status + '?')) {
            alert('Status update for consultation #' + id + ' to ' + status + ' - Feature to be implemented');
            // After successful update, reload the page or update the row
        }
    }

    // View medical report
    function viewMedicalReport(id) {
        // TODO: Redirect to medical report page or open report modal
        alert('View medical report for consultation #' + id + ' - Feature to be implemented');
    }

    // Export consultations
    function exportConsultations() {
        // TODO: Export consultations to CSV or PDF
        alert('Export consultations - Feature to be implemented');
    }

    // Close modal on escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeDetailsModal();
        }
    });
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- TODO: Set these attributes in the servlet before forwarding -->
<c:set var="pageTitle" value="Consultations Management" scope="request"/>
<c:set var="activePage" value="consultations" scope="request"/>
<c:set var="contentPage" value="/WEB-INF/view/admin/consultations-content.jsp" scope="request"/>

<jsp:include page="/WEB-INF/view/layout/admin-layout.jsp"/>

