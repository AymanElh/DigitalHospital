<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- Set the content for the layout -->
<c:set var="pageTitle" value="Add New Doctor" scope="request"/>
<c:set var="pageContent" scope="request">

    <!-- Breadcrumb Navigation -->
    <nav class="flex mb-6" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center">
                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="inline-flex items-center text-sm text-gray-400 hover:text-white">
                    <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
                    </svg>
                    Dashboard
                </a>
            </li>
            <li>
                <div class="flex items-center">
                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                    </svg>
                    <a href="${pageContext.request.contextPath}/admin/doctors"
                       class="ml-1 text-sm text-gray-400 hover:text-white md:ml-2">Doctors</a>
                </div>
            </li>
            <li aria-current="page">
                <div class="flex items-center">
                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                    </svg>
                    <span class="ml-1 text-sm font-medium text-white md:ml-2">Add New Doctor</span>
                </div>
            </li>
        </ol>
    </nav>

    <!-- Page Header -->
    <div class="mb-6">
        <h2 class="text-2xl font-bold text-white mb-2">Add New Doctor</h2>
        <p class="text-gray-400">Fill in the information below to add a new doctor to the system</p>
    </div>

    <!-- Create Doctor Form -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <!-- TODO: Form action should point to servlet URL - e.g., ${pageContext.request.contextPath}/admin/doctors -->
        <form action="${pageContext.request.contextPath}/admin/doctors" method="POST" id="createDoctorForm">
            <input type="hidden" name="action" value="create">

            <!-- Personal Information Section -->
            <div class="mb-8">
                <h3 class="text-lg font-semibold text-white mb-4 pb-2 border-b border-gray-700">
                    Personal Information
                </h3>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- First Name -->
                    <div>
                        <label for="firstName" class="block text-sm font-medium text-gray-300 mb-2">
                            First Name <span class="text-red-500">*</span>
                        </label>
                        <input type="text"
                               id="firstName"
                               name="firstName"
                               required
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="Enter first name"
                               value="${param.firstName}">
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.firstName}">
                            <p class="mt-1 text-sm text-red-500">${errors.firstName}</p>
                        </c:if>
                    </div>

                    <!-- Last Name -->
                    <div>
                        <label for="lastName" class="block text-sm font-medium text-gray-300 mb-2">
                            Last Name <span class="text-red-500">*</span>
                        </label>
                        <input type="text"
                               id="lastName"
                               name="lastName"
                               required
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="Enter last name"
                               value="${param.lastName}">
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.lastName}">
                            <p class="mt-1 text-sm text-red-500">${errors.lastName}</p>
                        </c:if>
                    </div>

                    <!-- Email -->
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-300 mb-2">
                            Email Address <span class="text-red-500">*</span>
                        </label>
                        <input type="email"
                               id="email"
                               name="email"
                               required
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="doctor@example.com"
                               value="${param.email}">
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.email}">
                            <p class="mt-1 text-sm text-red-500">${errors.email}</p>
                        </c:if>
                    </div>

                    <!-- Phone Number (if needed in User entity) -->
                    <div>
                        <label for="phone" class="block text-sm font-medium text-gray-300 mb-2">
                            Phone Number
                        </label>
                        <input type="tel"
                               id="phone"
                               name="phone"
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="+1 (555) 123-4567"
                               value="${param.phone}">
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.phone}">
                            <p class="mt-1 text-sm text-red-500">${errors.phone}</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Professional Information Section -->
            <div class="mb-8">
                <h3 class="text-lg font-semibold text-white mb-4 pb-2 border-b border-gray-700">
                    Professional Information
                </h3>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Specialty -->
                    <div>
                        <label for="speciality" class="block text-sm font-medium text-gray-300 mb-2">
                            Specialty <span class="text-red-500">*</span>
                        </label>
                        <input type="text"
                               id="speciality"
                               name="speciality"
                               required
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="e.g., Cardiologist, Neurologist"
                               value="${param.speciality}">
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.speciality}">
                            <p class="mt-1 text-sm text-red-500">${errors.speciality}</p>
                        </c:if>
                    </div>

                    <!-- Department -->
                    <div>
                        <label for="departmentId" class="block text-sm font-medium text-gray-300 mb-2">
                            Department <span class="text-red-500">*</span>
                        </label>
                        <select id="departmentId"
                                name="departmentId"
                                required
                                class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            <option value="">Select a department</option>
                            <!-- TODO: Replace with dynamic data from servlet -->

                            <c:forEach var="department" items="${departments}">
                                <option value="${department.id}" ${param.departmentId eq department.id ? 'selected' : ''}>
                                    <c:out value="${department.name}"/>
                                </option>
                            </c:forEach>
                        </select>
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.departmentId}">
                            <p class="mt-1 text-sm text-red-500">${errors.departmentId}</p>
                        </c:if>
                    </div>

                    <!-- Room (Optional) -->
                    <div>
                        <label for="roomId" class="block text-sm font-medium text-gray-300 mb-2">
                            Assigned Room <span class="text-gray-500">(Optional)</span>
                        </label>
                        <!-- TODO: Populate rooms from servlet using ${rooms} -->
                        <select id="roomId"
                                name="roomId"
                                class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            <option value="">No room assigned</option>
                            <!-- TODO: Replace with dynamic data from servlet -->
                            <c:forEach var="room" items="${rooms}">
                                <option value="${room.id}" ${param.roomId eq room.id ? 'selected' : ''}>
                                    Room ${room.roomNumber}
                                </option>
                            </c:forEach>
                        </select>
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.roomId}">
                            <p class="mt-1 text-sm text-red-500">${errors.roomId}</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Account Security Section -->
            <div class="mb-8">
                <h3 class="text-lg font-semibold text-white mb-4 pb-2 border-b border-gray-700">
                    Account Security
                </h3>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
                            Password <span class="text-red-500">*</span>
                        </label>
                        <input type="password"
                               id="password"
                               name="password"
                               required
                               minlength="8"
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="Enter password (min. 8 characters)">
                        <p class="mt-1 text-xs text-gray-400">Must be at least 8 characters long</p>
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.password}">
                            <p class="mt-1 text-sm text-red-500">${errors.password}</p>
                        </c:if>
                    </div>

                    <!-- Confirm Password -->
                    <div>
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-300 mb-2">
                            Confirm Password <span class="text-red-500">*</span>
                        </label>
                        <input type="password"
                               id="confirmPassword"
                               name="confirmPassword"
                               required
                               minlength="8"
                               class="w-full bg-gray-700 text-white px-4 py-3 rounded-lg border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               placeholder="Confirm password">
                        <p class="mt-1 text-xs text-gray-400">Must match the password above</p>
                        <!-- TODO: Display validation error from servlet if exists -->
                        <c:if test="${not empty errors.confirmPassword}">
                            <p class="mt-1 text-sm text-red-500">${errors.confirmPassword}</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="flex items-center justify-end space-x-4 pt-6 border-t border-gray-700">
                <a href="${pageContext.request.contextPath}/admin/doctors"
                   class="px-6 py-3 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition duration-200">
                    Cancel
                </a>
                <button type="reset"
                        class="px-6 py-3 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition duration-200">
                    Reset Form
                </button>
                <button type="submit"
                        class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition duration-200 flex items-center space-x-2">
                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    <span>Create Doctor</span>
                </button>
            </div>
        </form>
    </div>

</c:set>

<!-- Include the admin layout -->
<jsp:include page="/WEB-INF/view/layout/admin-layout.jsp"/>

<script>
    // Client-side validation for password matching
    document.getElementById('createDoctorForm').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            alert('Passwords do not match. Please try again.');
            document.getElementById('confirmPassword').focus();
        }
    });
</script>

