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

                    <!-- For PATIENT role -->
                    <c:if test="${sessionScope.user.role == 'PATIENT'}">
                        <a href="${pageContext.request.contextPath}/patient/appointments"
                           class="text-gray-300 hover:text-white transition">My Appointments</a>
                        <a href="${pageContext.request.contextPath}/patient/history"
                           class="text-gray-300 hover:text-white transition">History</a>
                    </c:if>

                    <!-- For DOCTOR role -->
                    <c:if test="${sessionScope.user.role == 'DOCTOR'}">
                        <a href="${pageContext.request.contextPath}/doctor/dashboard"
                           class="text-gray-300 hover:text-white transition">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/doctor/schedule"
                           class="text-gray-300 hover:text-white transition">My Schedule</a>
                        <a href="${pageContext.request.contextPath}/doctor/consultations"
                           class="text-gray-300 hover:text-white transition">Consultations</a>
                    </c:if>

                    <!-- For ADMIN role -->
                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           class="text-gray-300 hover:text-white transition">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/admin/doctors"
                           class="text-gray-300 hover:text-white transition">Manage Doctors</a>
                        <a href="${pageContext.request.contextPath}/admin/rooms"
                           class="text-gray-300 hover:text-white transition">Rooms</a>
                        <a href="${pageContext.request.contextPath}/admin/statistics"
                           class="text-gray-300 hover:text-white transition">Statistics</a>
                    </c:if>

                    <!-- User Profile Dropdown -->
                    <div class="relative" id="profileDropdown">
                        <button onclick="toggleProfileDropdown()"
                                class="flex items-center space-x-3 text-gray-300 hover:text-white focus:outline-none">
                            <!-- Circle Profile Picture with Initials -->
                            <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                                ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                            </div>
                            <!-- User Name -->
                            <span class="font-medium">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                            <!-- Dropdown Arrow -->
                            <svg class="h-5 w-5 transition-transform" id="dropdownArrow" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                            </svg>
                        </button>

                        <!-- Dropdown Menu -->
                        <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-gray-800 rounded-lg shadow-lg border border-gray-700 z-50">
                            <div class="py-2">
                                <!-- User Info -->
                                <div class="px-4 py-3 border-b border-gray-700">
                                    <p class="text-sm font-semibold text-white">${sessionScope.user.firstName} ${sessionScope.user.lastName}</p>
                                    <p class="text-xs text-gray-400">${sessionScope.user.email}</p>
                                    <p class="text-xs text-blue-500 mt-1">${sessionScope.user.role}</p>
                                </div>

                                <!-- Profile Link -->
                                <a href="${pageContext.request.contextPath}/profile"
                                   class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700 hover:text-white transition">
                                    <div class="flex items-center space-x-2">
                                        <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                        </svg>
                                        <span>My Profile</span>
                                    </div>
                                </a>

                                <!-- Settings Link -->
                                <a href="${pageContext.request.contextPath}/settings"
                                   class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700 hover:text-white transition">
                                    <div class="flex items-center space-x-2">
                                        <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                        <span>Settings</span>
                                    </div>
                                </a>

                                <!-- Divider -->
                                <div class="border-t border-gray-700 my-1"></div>

                                <!-- Logout Button -->
                                <form method="post" action="${pageContext.request.contextPath}/logout"
                                   class="block px-4 py-2 text-sm text-red-400 hover:bg-gray-700 hover:text-red-300 transition">
                                    <div class="flex items-center space-x-2">
                                        <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                                        </svg>
                                        <button type="submit">Logout</button>
                                    </div>
                                </form>
                            </div>
                        </div>
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

                <!-- Mobile version of role-based navigation -->
                <c:if test="${not empty sessionScope.user}">
                    <!-- User Info in Mobile -->
                    <div class="px-3 py-2 bg-gray-800 rounded border border-gray-700">
                        <div class="flex items-center space-x-3 mb-2">
                            <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                                ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                            </div>
                            <div>
                                <p class="text-sm font-semibold text-white">${sessionScope.user.firstName} ${sessionScope.user.lastName}</p>
                                <p class="text-xs text-blue-500">${sessionScope.user.role}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Patient Mobile Menu -->
                    <c:if test="${sessionScope.user.role == 'PATIENT'}">
                        <a href="${pageContext.request.contextPath}/patient/appointments"
                           class="text-gray-300 hover:text-white transition pl-3">My Appointments</a>
                        <a href="${pageContext.request.contextPath}/patient/history"
                           class="text-gray-300 hover:text-white transition pl-3">History</a>
                    </c:if>

                    <!-- Doctor Mobile Menu -->
                    <c:if test="${sessionScope.user.role == 'DOCTOR'}">
                        <a href="${pageContext.request.contextPath}/doctor/dashboard"
                           class="text-gray-300 hover:text-white transition pl-3">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/doctor/schedule"
                           class="text-gray-300 hover:text-white transition pl-3">My Schedule</a>
                        <a href="${pageContext.request.contextPath}/doctor/consultations"
                           class="text-gray-300 hover:text-white transition pl-3">Consultations</a>
                    </c:if>

                    <!-- Admin Mobile Menu -->
                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           class="text-gray-300 hover:text-white transition pl-3">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/admin/doctors"
                           class="text-gray-300 hover:text-white transition pl-3">Manage Doctors</a>
                        <a href="${pageContext.request.contextPath}/admin/rooms"
                           class="text-gray-300 hover:text-white transition pl-3">Rooms</a>
                        <a href="${pageContext.request.contextPath}/admin/statistics"
                           class="text-gray-300 hover:text-white transition pl-3">Statistics</a>
                    </c:if>

                    <!-- Profile & Settings -->
                    <a href="${pageContext.request.contextPath}/profile"
                       class="text-gray-300 hover:text-white transition pl-3">My Profile</a>
                    <a href="${pageContext.request.contextPath}/settings"
                       class="text-gray-300 hover:text-white transition pl-3">Settings</a>

                    <!-- Logout -->
                    <a href="${pageContext.request.contextPath}/logout"
                       class="text-red-400 hover:text-red-300 transition pl-3">Logout</a>
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

    // Toggle profile dropdown visibility
    function toggleProfileDropdown() {
        const dropdown = document.getElementById('dropdownMenu');
        const arrow = document.getElementById('dropdownArrow');
        dropdown.classList.toggle('hidden');
        arrow.classList.toggle('rotate-180');
    }

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById('profileDropdown');
        const menu = document.getElementById('dropdownMenu');

        if (dropdown && !dropdown.contains(event.target)) {
            menu.classList.add('hidden');
            document.getElementById('dropdownArrow').classList.remove('rotate-180');
        }
    });
</script>
