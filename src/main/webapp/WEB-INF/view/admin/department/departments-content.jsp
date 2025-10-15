<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Page Header with Add Button -->
<div class="flex items-center justify-between mb-6">
    <div>
        <h2 class="text-2xl font-bold text-white mb-2">Departments Management</h2>
        <p class="text-gray-400">Manage all clinic departments and their information</p>
    </div>
    <button onclick="openCreateModal()"
            class="flex items-center space-x-2 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg transition">
        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
        </svg>
        <span>Add Department</span>
    </button>
</div>

<!-- Departments Table -->
<div class="bg-gray-800 border border-gray-700 rounded-lg overflow-hidden">
    <!-- Table Header -->
    <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
        <h3 class="text-lg font-semibold text-white">All Departments</h3>
        <!-- Search Bar -->
        <div class="relative">
            <input type="text"
                   placeholder="Search departments..."
                   class="bg-gray-700 text-white px-4 py-2 rounded-lg pl-10 focus:outline-none focus:ring-2 focus:ring-blue-500">
            <svg class="h-5 w-5 text-gray-400 absolute left-3 top-2.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
        </div>
    </div>

    <!-- Table -->
    <div class="overflow-x-auto">
        <table class="w-full">
            <thead class="bg-gray-700">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Department Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Description</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Number of Doctors</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-right text-xs font-medium text-gray-300 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
                <!-- TODO: Loop through departments list from servlet using <c:forEach var="department" items="${departments}"> -->

                <!-- Sample Department Row 1 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">1</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-blue-600 p-2 rounded">
                                <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                </svg>
                            </div>
                            <span class="text-sm font-medium text-white">Cardiology</span>
                        </div>
                    </td>
                    <td class="px-6 py-4 text-sm text-gray-400">Heart and cardiovascular system specialists</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">5</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="openEditModal(1, 'Cardiology', 'Heart and cardiovascular system specialists')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(1, 'Cardiology')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Department Row 2 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">2</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-green-600 p-2 rounded">
                                <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" />
                                </svg>
                            </div>
                            <span class="text-sm font-medium text-white">Neurology</span>
                        </div>
                    </td>
                    <td class="px-6 py-4 text-sm text-gray-400">Brain and nervous system specialists</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">4</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="openEditModal(2, 'Neurology', 'Brain and nervous system specialists')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(2, 'Neurology')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Department Row 3 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">3</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-purple-600 p-2 rounded">
                                <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                                </svg>
                            </div>
                            <span class="text-sm font-medium text-white">Orthopedics</span>
                        </div>
                    </td>
                    <td class="px-6 py-4 text-sm text-gray-400">Bones, joints, and muscles specialists</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">6</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="openEditModal(3, 'Orthopedics', 'Bones, joints, and muscles specialists')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(3, 'Orthopedics')"
                                class="text-red-500 hover:text-red-400 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </td>
                </tr>

                <!-- Sample Department Row 4 -->
                <tr class="hover:bg-gray-750 transition">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">4</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex items-center space-x-3">
                            <div class="bg-orange-600 p-2 rounded">
                                <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <span class="text-sm font-medium text-white">Pediatrics</span>
                        </div>
                    </td>
                    <td class="px-6 py-4 text-sm text-gray-400">Children's health specialists</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">3</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                        <button onclick="openEditModal(4, 'Pediatrics', 'Children\'s health specialists')"
                                class="text-blue-500 hover:text-blue-400 mr-3 transition">
                            <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                        </button>
                        <button onclick="confirmDelete(4, 'Pediatrics')"
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

<!-- Create/Edit Department Modal -->
<div id="departmentModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
        <!-- Modal Header -->
        <div class="flex items-center justify-between px-6 py-4 border-b border-gray-700">
            <h3 id="modalTitle" class="text-lg font-bold text-white">Add New Department</h3>
            <button onclick="closeModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <!-- Modal Form -->
        <!-- TODO: Form action should point to servlet URL like ${pageContext.request.contextPath}/admin/departments -->
        <form id="departmentForm" method="POST" action="#" class="px-6 py-4">
            <input type="hidden" id="departmentId" name="id" value="">
            <input type="hidden" id="formAction" name="action" value="create">

            <!-- Department Name -->
            <div class="mb-4">
                <label for="departmentName" class="block text-sm font-medium text-gray-300 mb-2">
                    Department Name *
                </label>
                <input type="text"
                       id="departmentName"
                       name="name"
                       required
                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="e.g., Cardiology">
            </div>

            <!-- Description -->
            <div class="mb-6">
                <label for="departmentDescription" class="block text-sm font-medium text-gray-300 mb-2">
                    Description *
                </label>
                <textarea id="departmentDescription"
                          name="description"
                          rows="3"
                          required
                          class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                          placeholder="Brief description of the department"></textarea>
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
                    <span id="submitButtonText">Create Department</span>
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
            <h3 class="text-lg font-bold text-white text-center mb-2">Delete Department</h3>
            <p class="text-gray-400 text-center mb-6">
                Are you sure you want to delete <span id="deleteDepartmentName" class="text-white font-semibold"></span>?
                This action cannot be undone.
            </p>

            <!-- TODO: Form should submit to servlet with action=delete and id parameter -->
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
        document.getElementById('modalTitle').textContent = 'Add New Department';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitButtonText').textContent = 'Create Department';
        document.getElementById('departmentId').value = '';
        document.getElementById('departmentName').value = '';
        document.getElementById('departmentDescription').value = '';
        document.getElementById('departmentModal').classList.remove('hidden');
    }

    // Open edit modal
    function openEditModal(id, name, description) {
        document.getElementById('modalTitle').textContent = 'Edit Department';
        document.getElementById('formAction').value = 'update';
        document.getElementById('submitButtonText').textContent = 'Update Department';
        document.getElementById('departmentId').value = id;
        document.getElementById('departmentName').value = name;
        document.getElementById('departmentDescription').value = description;
        document.getElementById('departmentModal').classList.remove('hidden');
    }

    // Close modal
    function closeModal() {
        document.getElementById('departmentModal').classList.add('hidden');
    }

    // Open delete confirmation
    function confirmDelete(id, name) {
        document.getElementById('deleteId').value = id;
        document.getElementById('deleteDepartmentName').textContent = name;
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
<c:set var="pageTitle" value="Departments Management" scope="request"/>
<c:set var="activePage" value="departments" scope="request"/>
<c:set var="contentPage" value="/WEB-INF/view/admin/departments-content.jsp" scope="request"/>

<jsp:include page="/WEB-INF/view/layout/admin-layout.jsp"/>

