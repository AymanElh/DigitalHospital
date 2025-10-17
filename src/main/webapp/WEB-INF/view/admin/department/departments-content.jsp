<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
            <input type="text" id="searchInput" onkeyup="searchDepartments()"
                   placeholder="Search departments..."
                   class="bg-gray-700 text-white px-4 py-2 rounded-lg pl-10 focus:outline-none focus:ring-2 focus:ring-blue-500">
            <svg class="h-5 w-5 text-gray-400 absolute left-3 top-2.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
        </div>
    </div>

    <!-- Table -->
    <div class="overflow-x-auto">
        <table class="w-full" id="departmentsTable">
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
                <!-- Loop through departments list from servlet -->
                <c:choose>
                    <c:when test="${empty departments}">
                        <tr>
                            <td colspan="6" class="px-6 py-8 text-center text-gray-400">
                                <svg class="h-12 w-12 mx-auto mb-3 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
                                </svg>
                                <p class="text-lg">No departments found</p>
                                <p class="text-sm mt-1">Click "Add Department" to create your first department</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="department" items="${departments}">
                            <tr class="hover:bg-gray-750 transition" data-department-id="${department.id}">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">
                                    <c:out value="${department.id}"/>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center space-x-3">
                                        <div class="bg-blue-600 p-2 rounded">
                                            <svg class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                                            </svg>
                                        </div>
                                        <span class="text-sm font-medium text-white">
                                            <c:out value="${department.name}"/>
                                        </span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-400">
                                    <c:out value="${department.description}"/>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">
                                    <c:out value="${department.doctorCount}"/>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-3 py-1 text-xs font-medium bg-green-600 text-white rounded-full">Active</span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-right text-sm">
                                    <button onclick="openEditModal(${department.id}, '${department.name}', '${department.description}')"
                                            class="text-blue-500 hover:text-blue-400 mr-3 transition"
                                            title="Edit Department">
                                        <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                        </svg>
                                    </button>
                                    <button onclick="confirmDelete(${department.id}, '${department.name}')"
                                            class="text-red-500 hover:text-red-400 transition"
                                            title="Delete Department">
                                        <svg class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<!-- Create Department Modal -->
<div id="createModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
    <div class="bg-gray-800 rounded-lg p-6 w-full max-w-md mx-4">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-xl font-bold text-white">Add New Department</h3>
            <button onclick="closeCreateModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <form action="${pageContext.request.contextPath}/admin/departments" method="POST" id="createForm">
            <input type="hidden" name="action" value="create">

            <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-300 mb-2">
                    Department Name <span class="text-red-500">*</span>
                </label>
                <input type="text" id="name" name="name" required
                       class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="e.g. Cardiology">
            </div>

            <div class="mb-6">
                <label for="description" class="block text-sm font-medium text-gray-300 mb-2">
                    Description
                </label>
                <textarea id="description" name="description" rows="4"
                          class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                          placeholder="Brief description of the department..."></textarea>
            </div>

            <div class="flex space-x-3">
                <button type="submit"
                        class="flex-1 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition">
                    Create Department
                </button>
                <button type="button" onclick="closeCreateModal()"
                        class="flex-1 bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded-lg transition">
                    Cancel
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Department Modal -->
<div id="editModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
    <div class="bg-gray-800 rounded-lg p-6 w-full max-w-md mx-4">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-xl font-bold text-white">Edit Department</h3>
            <button onclick="closeEditModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <form action="${pageContext.request.contextPath}/admin/departments" method="POST" id="editForm">
            <input type="hidden" name="action" value="update">
            <input type="hidden" id="editId" name="id">

            <div class="mb-4">
                <label for="editName" class="block text-sm font-medium text-gray-300 mb-2">
                    Department Name <span class="text-red-500">*</span>
                </label>
                <input type="text" id="editName" name="name" required
                       class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="e.g. Cardiology">
            </div>

            <div class="mb-6">
                <label for="editDescription" class="block text-sm font-medium text-gray-300 mb-2">
                    Description
                </label>
                <textarea id="editDescription" name="description" rows="4"
                          class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                          placeholder="Brief description of the department..."></textarea>
            </div>

            <div class="flex space-x-3">
                <button type="submit"
                        class="flex-1 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition">
                    Update Department
                </button>
                <button type="button" onclick="closeEditModal()"
                        class="flex-1 bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded-lg transition">
                    Cancel
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
    <div class="bg-gray-800 rounded-lg p-6 w-full max-w-md mx-4">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-xl font-bold text-white">Confirm Delete</h3>
            <button onclick="closeDeleteModal()" class="text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <div class="mb-6">
            <div class="flex items-center justify-center mb-4">
                <div class="bg-red-900 bg-opacity-20 p-3 rounded-full">
                    <svg class="h-12 w-12 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                </div>
            </div>
            <p class="text-gray-300 text-center mb-2">Are you sure you want to delete this department?</p>
            <p class="text-white font-semibold text-center text-lg" id="deleteDepartmentName"></p>
            <p class="text-gray-400 text-sm text-center mt-2">This action cannot be undone.</p>
        </div>

        <form action="${pageContext.request.contextPath}/admin/departments" method="POST" id="deleteForm">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" id="deleteId" name="id">
            <input type="hidden" id="deleteName" name="name">

            <div class="flex space-x-3">
                <button type="submit"
                        class="flex-1 bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg transition">
                    Delete Department
                </button>
                <button type="button" onclick="closeDeleteModal()"
                        class="flex-1 bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded-lg transition">
                    Cancel
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Modal functions
    function openCreateModal() {
        document.getElementById('createModal').classList.remove('hidden');
    }

    function closeCreateModal() {
        document.getElementById('createModal').classList.add('hidden');
        document.getElementById('createForm').reset();
    }

    function openEditModal(id, name, description) {
        document.getElementById('editModal').classList.remove('hidden');
        document.getElementById('editId').value = id;
        document.getElementById('editName').value = name;
        document.getElementById('editDescription').value = description;
    }

    function closeEditModal() {
        document.getElementById('editModal').classList.add('hidden');
    }

    function confirmDelete(id, name) {
        document.getElementById('deleteModal').classList.remove('hidden');
        document.getElementById('deleteId').value = id;
        document.getElementById('deleteName').value = name;
        document.getElementById('deleteDepartmentName').innerText = name;
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.add('hidden');
    }

    // Search functionality
    function searchDepartments() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const table = document.getElementById('departmentsTable');
        const rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) {
            const row = rows[i];
            const cells = row.getElementsByTagName('td');
            let found = false;

            for (let j = 0; j < cells.length; j++) {
                const cell = cells[j];
                if (cell) {
                    const textValue = cell.textContent || cell.innerText;
                    if (textValue.toLowerCase().indexOf(filter) > -1) {
                        found = true;
                        break;
                    }
                }
            }

            row.style.display = found ? '' : 'none';
        }
    }

    // Close modals on Escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeCreateModal();
            closeEditModal();
            closeDeleteModal();
        }
    });
</script>
