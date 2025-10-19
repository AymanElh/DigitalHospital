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
                <p class="text-3xl font-bold text-white">
                    <c:choose>
                        <c:when test="${not empty rooms}">
                            ${rooms.size()}
                        </c:when>
                        <c:otherwise>0</c:otherwise>
                    </c:choose>
                </p>
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
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Room Number
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Status</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Doctor</th>
                <th class="px-6 py-3 text-right text-xs font-medium text-gray-300 uppercase tracking-wider">Actions</th>
            </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
            <!-- TODO: Loop through rooms list from servlet -->
            <c:choose>
                <c:when test="${not empty rooms}">
                    <c:forEach var="room" items="${rooms}">
                        <tr class="hover:bg-gray-750 transition" data-room-id="${room.id}">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center space-x-3">
                                    <div class="bg-blue-600 w-10 h-10 rounded flex items-center justify-center">
                                        <span class="text-white font-bold text-sm">${room.roomNumber}</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <c:choose>
                                    <c:when test="true">
                                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Available</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="px-3 py-1 text-xs font-medium bg-red-600 text-white rounded-full">Occupied</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">Doctor</td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                                <button onclick="viewRoomSchedule('${room.roomNumber}')"
                                        class="text-purple-500 hover:text-purple-400 mr-3 transition"
                                        title="View Schedule">
                                    <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                    </svg>
                                </button>
                                <button onclick="openEditModal('${room.id}', '${room.roomNumber}')"
                                        class="text-blue-500 hover:text-blue-400 mr-3 transition">
                                    <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                    </svg>
                                </button>
                                <button onclick="confirmDelete('${room.id}', '${room.roomNumber}')"
                                        class="text-red-500 hover:text-red-400 transition">
                                    <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="3" class="px-6 py-8 text-center text-gray-400">
                            <div class="flex flex-col items-center">
                                <svg class="h-12 w-12 text-gray-600 mb-3" fill="none" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                                </svg>
                                <p class="text-lg font-medium">No rooms found</p>
                                <p class="text-sm">Click "Add Room" to create your first room</p>
                            </div>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
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
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>
        </div>

        <!-- Modal Form -->
        <form id="roomForm" method="POST" action="${pageContext.request.contextPath}/admin/rooms" class="px-6 py-4">
            <input type="hidden" id="roomId" name="id" value="">
            <input type="hidden" id="formAction" name="action" value="create">

            <!-- Room Number -->
            <div class="mb-4">
                <label for="roomNumber" class="block text-sm font-medium text-gray-300 mb-2">
                    Room Number *
                </label>
                <input type="number"
                       id="roomNumber"
                       name="roomNumber"
                       required
                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="e.g., 101">
                <c:if test="${not empty sessionScope.errors.roomNumber}">
                    <p class="text-red-500 text-xs mt-1">${sessionScope.errors.roomNumber}</p>
                </c:if>
            </div>

            <!-- Modal Actions -->
            <div class="flex justify-end space-x-3 mt-6">
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
            <div class="flex justify-center space-x-3">
                <button type="button"
                        onclick="closeDeleteModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="button"
                        id="confirmation-delete-btn"
                        class="px-6 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition">
                    Delete
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    let currentRoomId = null;
    let currentRoomNumber = null;

    // Open create modal
    function openCreateModal() {
        document.getElementById('modalTitle').textContent = 'Add New Room';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitButtonText').textContent = 'Create Room';
        document.getElementById('roomId').value = '';
        document.getElementById('roomNumber').value = '';
        document.getElementById('roomModal').classList.remove('hidden');
    }

    // Open edit modal
    function openEditModal(id, roomNumber) {
        document.getElementById('modalTitle').textContent = 'Edit Room';
        document.getElementById('formAction').value = 'update';
        document.getElementById('submitButtonText').textContent = 'Update Room';
        document.getElementById('roomId').value = id;
        document.getElementById('roomNumber').value = roomNumber;
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
        console.log(id, roomNumber);
        if(id && roomNumber) {
            // document.getElementById('deleteId').value = id;
            document.getElementById('deleteRoomNumber').textContent = roomNumber;
            document.getElementById('deleteModal').classList.remove('hidden');
        } else {
            console.error("Id or room number undefined");
        }
        currentRoomId = id;
        currentRoomNumber = roomNumber
    }

    // Close delete modal
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.add('hidden');
        currentRoomId = null
        currentRoomNumber = null;
    }

    // Close modals on escape key
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            closeModal();
            closeDeleteModal();
        }
    });

    // Send delete request with js
    document.getElementById("confirmation-delete-btn").addEventListener("click", function() {
        console.log(this);
        if(currentRoomId) {
            deleteRoom(currentRoomId, currentRoomNumber);
        }
    });

    async function deleteRoom(id, number) {
        try {
            const resp = await fetch(`/admin/rooms?id=\${id}`, {
                method: "DELETE",
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            if(resp.ok) {
                console.log("Room deleted successfully")
                const row = document.querySelector(`tr[data-room-id="\${id}"]`);
                if(row) {
                    row.remove();
                }
                closeDeleteModal()
            }
        } catch (err) {
            console.error(err);
        }
    }

    // Auto-open create modal if there are validation errors
    <c:if test="${not empty sessionScope.errors}">
    window.addEventListener('DOMContentLoaded', function () {
        openCreateModal();
        <c:if test="${not empty sessionScope.dto}">
        document.getElementById('roomNumber').value = '${sessionScope.dto.roomNumber}';
        </c:if>
    });
    <c:remove var="errors" scope="session"/>
    <c:remove var="dto" scope="session"/>
    </c:if>
</script>

