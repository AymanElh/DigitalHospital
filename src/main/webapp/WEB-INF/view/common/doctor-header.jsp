<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Doctor Header Component -->
<header class="bg-gray-800 border-b border-gray-700 px-6 py-4">
    <div class="flex items-center justify-between">
        <!-- Page Title and Breadcrumb -->
        <div class="flex items-center space-x-4">
            <!-- Mobile menu button -->
            <button onclick="toggleSidebar()" class="md:hidden text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                </svg>
            </button>

            <div>
                <h1 class="text-xl font-bold text-white">
                    <c:choose>
                        <c:when test="${not empty pageTitle}">
                            ${pageTitle}
                        </c:when>
                        <c:otherwise>Doctor Dashboard</c:otherwise>
                    </c:choose>
                </h1>
                <p class="text-sm text-gray-400">Welcome back, Dr.
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            ${sessionScope.user.firstName}
                        </c:when>
                        <c:otherwise>Smith</c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>

        <!-- Header Actions -->
        <div class="flex items-center space-x-4">
            <!-- Quick Stats -->
            <div class="hidden md:flex items-center space-x-6 text-sm">
                <div class="text-center">
                    <div class="text-xl font-bold text-green-400">5</div>
                    <div class="text-xs text-gray-400">Completed</div>
                </div>
                <div class="text-center">
                    <div class="text-xl font-bold text-yellow-400">3</div>
                    <div class="text-xs text-gray-400">Pending</div>
                </div>
                <div class="text-center">
                    <div class="text-xl font-bold text-blue-400">8</div>
                    <div class="text-xs text-gray-400">Today</div>
                </div>
            </div>

            <!-- Divider -->
            <div class="hidden md:block h-8 w-px bg-gray-600"></div>

            <!-- Notifications -->
            <button class="relative p-2 text-gray-400 hover:text-white hover:bg-gray-700 rounded-lg transition">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M15 17h5l-5 5v-5zM15 17H9a4 4 0 01-4-4V9a4 4 0 014-4h4m2 8v4"/>
                </svg>
                <!-- Notification badge -->
                <span class="absolute -top-1 -right-1 h-4 w-4 bg-red-500 text-white text-xs rounded-full flex items-center justify-center">
                    3
                </span>
            </button>

            <!-- Emergency Button -->
            <button class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white text-sm font-medium rounded-lg transition">
                Emergency
            </button>

            <!-- Current Time -->
            <div class="hidden lg:block text-sm text-gray-300">
                <div id="currentTime" class="font-medium"></div>
                <div class="text-xs text-gray-400">Local Time</div>
            </div>
        </div>
    </div>
</header>

<script>
    // Update current time
    function updateTime() {
        const now = new Date();
        const timeString = now.toLocaleTimeString('en-US', {
            hour12: true,
            hour: '2-digit',
            minute: '2-digit'
        });
        const timeElement = document.getElementById('currentTime');
        if (timeElement) {
            timeElement.textContent = timeString;
        }
    }

    // Update time every second
    setInterval(updateTime, 1000);
    updateTime(); // Initial call
</script>
