<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header Navigation Component -->
<header class="bg-gray-900 border-b border-gray-800">
    <nav class="container mx-auto px-4 py-4">
        <div class="flex items-center justify-between">
            <!-- Logo and Brand -->
            <div class="flex items-center space-x-3">
                <div class="bg-blue-600 p-2 rounded">
                    <svg class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                    </svg>
                </div>
                <div>
                    <h1 class="text-xl font-bold text-white">Digital Clinic</h1>
                    <p class="text-xs text-gray-400">Clinic Management System</p>
                </div>
            </div>

            <!-- Desktop Navigation -->
            <div class="hidden md:flex items-center space-x-6">
                <!-- Public links (always visible) -->
                <a href="${pageContext.request.contextPath}/home"
                   class="text-gray-300 hover:text-white transition">Home</a>
                <a href="${pageContext.request.contextPath}/doctors"
                   class="text-gray-300 hover:text-white transition">Doctors</a>
                <a href="${pageContext.request.contextPath}/departments"
                   class="text-gray-300 hover:text-white transition">Departments</a>

                <!-- Check if user is logged in -->
                <c:if test="${not empty sessionScope.user}">
                    <!-- User is logged in - Show role-based navigation -->

                    <!-- TODO: For PATIENT role - ${sessionScope.user.role == 'PATIENT'} -->
                    <!-- Show: My Appointments, History, Profile -->

                    <!-- TODO: For DOCTOR role - ${sessionScope.user.role == 'DOCTOR'} -->
                    <!-- Show: Dashboard, My Schedule, Consultations -->

                    <!-- TODO: For ADMIN role - ${sessionScope.user.role == 'ADMIN'} -->
                    <!-- Show: Dashboard, Departments, Doctors, Rooms, Statistics -->

                    <!-- User Profile Dropdown -->
                    <div class="relative">
                        <button class="flex items-center space-x-2 text-gray-300 hover:text-white">
                            <span>${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                            </svg>
                        </button>
                        <!-- TODO: Add dropdown menu with Profile and Logout links -->
                    </div>
                </c:if>

                <!-- Show Login/Register only if NOT logged in -->
                <c:if test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-gray-300 hover:text-white transition">Login</a>
                    <a href="${pageContext.request.contextPath}/register"
                       class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded transition">
                        Register
                    </a>
                </c:if>
            </div>

            <!-- Mobile Menu Button -->
            <button class="md:hidden text-white" onclick="toggleMobileMenu()">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
            </button>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu" class="hidden md:hidden mt-4 pb-4 border-t border-gray-800">
            <div class="flex flex-col space-y-3 pt-4">
                <a href="${pageContext.request.contextPath}/home"
                   class="text-gray-300 hover:text-white transition">Home</a>
                <a href="${pageContext.request.contextPath}/doctors"
                   class="text-gray-300 hover:text-white transition">Doctors</a>
                <a href="${pageContext.request.contextPath}/departments"
                   class="text-gray-300 hover:text-white transition">Departments</a>

                <!-- TODO: Add mobile version of role-based navigation -->

                <c:if test="${not empty sessionScope.user}">
                    <!-- TODO: Show user-specific mobile menu items based on role -->
                    <a href="${pageContext.request.contextPath}/logout"
                       class="text-red-400 hover:text-red-300 transition">Logout</a>
                </c:if>

                <c:if test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-gray-300 hover:text-white transition">Login</a>
                    <a href="${pageContext.request.contextPath}/register"
                       class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded text-center transition">
                        Register
                    </a>
                </c:if>
            </div>
        </div>
    </nav>
</header>

<script>
    // Toggle mobile menu visibility
    function toggleMobileMenu() {
        const menu = document.getElementById('mobileMenu');
        menu.classList.toggle('hidden');
    }
</script>
