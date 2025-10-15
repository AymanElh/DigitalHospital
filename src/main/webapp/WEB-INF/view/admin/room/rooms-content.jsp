<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Page Header with Add Button -->
<div class="flex items-center justify-between mb-6">
    <div>
        <h2 class="text-2xl font-bold text-white mb-2">Rooms Management</h2>
        <p class="text-gray-400">Manage consultation rooms and their availability</p>
    </div>
    <button onclick="openCreateModal()"
            class="flex items-center space-x-2 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg transition">
        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
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
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
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
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
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
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
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
        <!-- Filter and Search -->
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
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Room Number</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Room Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Department</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Capacity</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Equipment</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-right text-xs font-medium text-gray-300 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
                <!-- TODO: Loop through rooms list from servlet using <c:forEach var="room" items="${rooms}"> -->

                <!-- Sample Room Row 1 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-blue-600 w-10 h-10 rounded flex items-center justify-center">
                                <span class="text-white font-bold text-sm">101</span>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-white">Consultation Room A</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Cardiology</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">4 people</td>
                    <td class="px-6 py-4 text-sm text-gray-400">ECG, Monitor, Bed</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Available</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewRoomSchedule(101)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Schedule">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(1, '101', 'Consultation Room A', 1, '4', 'ECG, Monitor, Bed')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(1, '101')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Room Row 2 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-green-600 w-10 h-10 rounded flex items-center justify-center">
                                <span class="text-white font-bold text-sm">102</span>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-white">Examination Room B</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Neurology</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">2 people</td>
                    <td class="px-6 py-4 text-sm text-gray-400">MRI Scanner, Computer</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-red-600 text-white rounded-full">Occupied</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewRoomSchedule(102)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Schedule">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(2, '102', 'Examination Room B', 2, '2', 'MRI Scanner, Computer')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(2, '102')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Room Row 3 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-purple-600 w-10 h-10 rounded flex items-center justify-center">
                                <span class="text-white font-bold text-sm">201</span>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-white">Surgery Room 1</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Orthopedics</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">8 people</td>
                    <td class="px-6 py-4 text-sm text-gray-400">Full surgical equipment</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Available</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewRoomSchedule(201)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Schedule">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(3, '201', 'Surgery Room 1', 3, '8', 'Full surgical equipment')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(3, '201')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Room Row 4 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-600 w-10 h-10 rounded flex items-center justify-center">
                                <span class="text-white font-bold text-sm">103</span>
                            </div>
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-white">Pediatric Room</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-400">Pediatrics</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">3 people</td>
                    <td class="px-6 py-4 text-sm text-gray-400">Play area, Basic equipment</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Available</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="viewRoomSchedule(103)"
                                class="text-purple-500 hover:text-purple-400 mr-3 transition" title="View Schedule">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </button>
                        <button onclick="openEditModal(4, '103', 'Pediatric Room', 4, '3', 'Play area, Basic equipment')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(4, '103')"
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

<!-- Create/Edit Room Modal -->
<div id="roomModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-lg w-full border border-gray-700">
        <!-- Modal Header -->
        <div class="flex items-center justify-between px-6 py-4 border-b border-gray-700">
            <h3 id="modalTitle" class="text-lg font-bold text-white">Add New Room</h3>
            <button onclick="closeModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <!-- Modal Form -->
        <!-- TODO: Form action should point to servlet URL -->
        <form id="roomForm" method="POST" action="#" class="px-6 py-4">
            <input type="hidden" id="roomId" name="id" value="">
            <input type="hidden" id="formAction" name="action" value="create">

            <div class="grid grid-cols-2 gap-4 mb-4">
                <!-- Room Number -->
                <div>
                    <label for="roomNumber" class="block text-sm font-medium text-gray-300 mb-2">
                        Room Number *
                    </label>
                    <input type="text"
                           id="roomNumber"
                           name="roomNumber"
                           required
                           class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="e.g., 101">
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

            <!-- Room Name -->
            <div class="mb-4">
                <label for="roomName" class="block text-sm font-medium text-gray-300 mb-2">
                    Room Name *
                </label>
                <input type="text"
                       id="roomName"
                       name="name"
                       required
                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="e.g., Consultation Room A">
            </div>

            <!-- Capacity -->
            <div class="mb-4">
                <label for="capacity" class="block text-sm font-medium text-gray-300 mb-2">
                    Capacity *
                </label>
                <input type="number"
                       id="capacity"
                       name="capacity"
                       min="1"
                       required
                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="e.g., 4">
            </div>

            <!-- Equipment -->
            <div class="mb-6">
                <label for="equipment" class="block text-sm font-medium text-gray-300 mb-2">
                    Equipment
                </label>
                <textarea id="equipment"
                          name="equipment"
                          rows="2"
                          class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                          placeholder="List equipment available in this room"></textarea>
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
                    <span id="submitButtonText">Create Room</span>
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
            <h3 class="text-lg font-bold text-white text-center mb-2">Delete Room</h3>
            <p class="text-gray-400 text-center mb-6">
                Are you sure you want to delete Room <span id="deleteRoomNumber" class="text-white font-semibold"></span>?
                This action cannot be undone.
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
        document.getElementById('modalTitle').textContent = 'Add New Room';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitButtonText').textContent = 'Create Room';
        document.getElementById('roomId').value = '';
        document.getElementById('roomNumber').value = '';
        document.getElementById('roomName').value = '';
        document.getElementById('departmentId').value = '';
        document.getElementById('capacity').value = '';
        document.getElementById('equipment').value = '';
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
        // TODO: Redirect to room schedule page or open schedule modal
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
<c:set var="pageTitle" value="Rooms Management" scope="request"/>
<c:set var="activePage" value="rooms" scope="request"/>
<c:set var="contentPage" value="/WEB-INF/view/admin/rooms-content.jsp" scope="request"/>

<jsp:include page="/WEB-INF/view/layout/admin-layout.jsp"/>

