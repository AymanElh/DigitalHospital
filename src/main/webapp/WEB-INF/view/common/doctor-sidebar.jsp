<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Doctor Sidebar Component -->
<aside id="sidebar"
       class="w-64 bg-gray-800 border-r border-gray-700 flex-shrink-0 transition-transform duration-300 fixed md:relative h-full z-40">
    <div class="flex flex-col h-full">
        <!-- Logo Section -->
        <div class="flex items-center justify-between px-6 py-5 border-b border-gray-700">
            <div class="flex items-center space-x-3">
                <div class="bg-blue-600 p-2 rounded">
                    <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
                <div>
                    <h2 class="text-lg font-bold text-white">Doctor Panel</h2>
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
                    <a href="${pageContext.request.contextPath}/doctor/dashboard"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/dashboard') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                        </svg>
                        <span class="font-medium">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/doctor/schedule"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/schedule') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                        <span class="font-medium">My Schedule</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/doctor/consultations"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/consultations') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/>
                        </svg>
                        <span class="font-medium">Consultations</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/doctor/patients"
                       class="flex items-center space-x-3 px-4 py-3 rounded-lg transition ${pageContext.request.requestURI.contains('/patients') ? 'bg-blue-600 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white'}">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                        </svg>
                        <span class="font-medium">Patients</span>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- User Profile Section -->
        <div class="border-t border-gray-700 p-4">
            <div class="flex items-center space-x-3 mb-3">
                <div class="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center text-white font-semibold">
                    <!-- TODO: Get from session - sessionScope.user.firstName and lastName -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            ${sessionScope.user.firstName.substring(0, 1).toUpperCase()}${sessionScope.user.lastName.substring(0, 1).toUpperCase()}
                        </c:when>
                        <c:otherwise>DR</c:otherwise>
                    </c:choose>
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-sm font-medium text-white truncate">
                        <!-- TODO: Get from session - sessionScope.user -->
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                Dr. ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                            </c:when>
                            <c:otherwise>Dr. John Smith</c:otherwise>
                        </c:choose>
                    </p>
                    <p class="text-xs text-gray-400 truncate">
                        <!-- TODO: Get from session - sessionScope.user.speciality -->
                        <c:choose>
                            <c:when test="${not empty sessionScope.user.speciality}">
                                ${sessionScope.user.speciality}
                            </c:when>
                            <c:otherwise>Cardiology</c:otherwise>
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

