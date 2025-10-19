<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Admin Sidebar Component -->
<aside id="sidebar"
       class="w-64 bg-gray-800 border-r border-gray-700 flex-shrink-0 transition-transform duration-300 fixed md:relative h-full z-40">
    <div class="flex flex-col h-full">
        <!-- Logo Section -->
        <div class="flex items-center justify-between px-6 py-5 border-b border-gray-700">
            <div class="flex items-center space-x-3">
                <div class="bg-blue-600 p-2 rounded">
                    <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                </div>
                <div>
                    <h2 class="text-lg font-bold text-white">Admin Panel</h2>
                </div>
            </div>
            <button onclick="toggleSidebar()" class="md:hidden text-gray-400 hover:text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>
        </div>

        <!-- Navigation Menu -->
        <nav class="flex-1 overflow-y-auto py-4">
            <ul class="space-y-1 px-3">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/dashboard"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/dashboard') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                        </svg>
                        <span class="font-medium">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/departments"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/departments') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                        </svg>
                        <span class="font-medium">Departments</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/rooms"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/rooms') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.343M11 7.343l1.657-1.657a2 2 0 012.828 0l2.829 2.829a2 2 0 010 2.828l-8.486 8.485M7 17h.01"/>
                        </svg>
                        <span class="font-medium">Rooms</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/doctors"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/doctors') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                        </svg>
                        <span class="font-medium">Doctors</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/consultations"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/consultations') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/>
                        </svg>
                        <span class="font-medium">Consultations</span>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- User Profile Section -->
        <div class="border-t border-gray-700 p-4">
            <div class="flex items-center space-x-3 mb-3">
                <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                        </c:when>
                        <c:otherwise>AD</c:otherwise>
                    </c:choose>
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-sm font-medium text-white truncate">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                ${sessionScope.user.firstName} ${sessionScope.userName}
                            </c:when>
                            <c:otherwise>Admin User</c:otherwise>
                        </c:choose>
                    </p>
                    <p class="text-xs text-gray-400 truncate">
                        <c:choose>
                            <c:when test="${not empty sessionScope.userEmail}">
                                ${sessionScope.user.email}
                            </c:when>
                            <c:otherwise>admin@clinic.com</c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/logout" method="post" class="w-full">
                <button type="submit"
                        class="flex items-center justify-center space-x-2 w-full px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition">
                    <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
                    </svg>
                    <span class="text-sm font-medium">Logout</span>
                </button>
            </form>

        </div>
    </div>
</aside>

