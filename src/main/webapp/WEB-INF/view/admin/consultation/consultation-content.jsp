<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- Consultation Content -->
<div class="space-y-6">

    <!-- Page Header -->
    <div class="flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-white">Consultations</h1>
            <p class="text-gray-400 mt-1">Manage and monitor all consultations</p>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <!-- Total Consultations -->
        <div class="bg-gray-800 rounded-lg border border-gray-700 p-4">
            <div class="flex items-center justify-between mb-2">
                <div class="bg-blue-900 p-2 rounded">
                    <svg class="h-5 w-5 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-400 mb-1">Total</p>
            <p class="text-2xl font-bold text-white">${totalConsultations}</p>
        </div>

        <!-- Completed -->
        <div class="bg-gray-800 rounded-lg border border-gray-700 p-4">
            <div class="flex items-center justify-between mb-2">
                <div class="bg-green-900 p-2 rounded">
                    <svg class="h-5 w-5 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-400 mb-1">Completed</p>
            <p class="text-2xl font-bold text-white">${completedCount}</p>
        </div>

        <!-- Validated -->
        <div class="bg-gray-800 rounded-lg border border-gray-700 p-4">
            <div class="flex items-center justify-between mb-2">
                <div class="bg-blue-900 p-2 rounded">
                    <svg class="h-5 w-5 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-400 mb-1">Validated</p>
            <p class="text-2xl font-bold text-white">${validatedCount}</p>
        </div>

        <!-- Reserved -->
        <div class="bg-gray-800 rounded-lg border border-gray-700 p-4">
            <div class="flex items-center justify-between mb-2">
                <div class="bg-yellow-900 p-2 rounded">
                    <svg class="h-5 w-5 text-yellow-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-400 mb-1">Reserved</p>
            <p class="text-2xl font-bold text-white">${reservedCount}</p>
        </div>
    </div>

    <!-- Filters -->
    <div class="bg-gray-800 rounded-lg border border-gray-700 p-4">
        <form method="GET" action="${pageContext.request.contextPath}/admin/consultations" class="flex flex-wrap gap-4 items-end">
            <!-- Status Filter -->
            <div class="flex-1 min-w-[200px]">
                <label class="block text-sm font-medium text-gray-300 mb-2">Filter by Status</label>
                <select name="status" class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="">All Statuses</option>
                    <option value="RESERVED" ${param.status == 'RESERVED' ? 'selected' : ''}>Reserved</option>
                    <option value="VALIDATED" ${param.status == 'VALIDATED' ? 'selected' : ''}>Validated</option>
                    <option value="COMPLETED" ${param.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                    <option value="CANCELLED" ${param.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                </select>
            </div>

            <!-- Date Filter -->
            <div class="flex-1 min-w-[200px]">
                <label class="block text-sm font-medium text-gray-300 mb-2">Filter by Date</label>
                <input type="date" name="date" value="${param.date}"
                       class="w-full bg-gray-700 text-white px-4 py-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <!-- Action Buttons -->
            <div class="flex gap-2">
                <button type="submit" class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                    Apply Filters
                </button>
                <a href="${pageContext.request.contextPath}/admin/consultations"
                   class="inline-flex items-center px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Clear
                </a>
            </div>
        </form>
    </div>

    <!-- Consultations Table -->
    <div class="bg-gray-800 rounded-lg border border-gray-700">
        <div class="px-6 py-4 border-b border-gray-700">
            <h2 class="text-xl font-semibold text-white">All Consultations</h2>
        </div>

        <div class="p-6">
            <c:choose>
                <c:when test="${empty consultations}">
                    <div class="text-center py-12">
                        <svg class="mx-auto h-12 w-12 text-gray-600 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <p class="text-gray-400 text-lg">No consultations found</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-700">
                            <thead>
                                <tr class="text-left text-xs text-gray-400 uppercase tracking-wider">
                                    <th class="px-4 py-3">ID</th>
                                    <th class="px-4 py-3">Patient</th>
                                    <th class="px-4 py-3">Doctor</th>
                                    <th class="px-4 py-3">Date & Time</th>
                                    <th class="px-4 py-3">Status</th>
                                    <th class="px-4 py-3">Reason</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-700">
                                <c:forEach var="consultation" items="${consultations}">
                                    <tr class="hover:bg-gray-700 transition">
                                        <td class="px-4 py-4 text-gray-300">
                                            #${consultation.id}
                                        </td>
                                        <td class="px-4 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-8 h-8 rounded-full bg-purple-600 flex items-center justify-center text-white text-sm font-semibold">
                                                    ${consultation.patient.firstName.substring(0,1).toUpperCase()}${consultation.patient.lastName.substring(0,1).toUpperCase()}
                                                </div>
                                                <div>
                                                    <p class="text-white font-medium">
                                                        <c:out value="${consultation.patient.firstName} ${consultation.patient.lastName}"/>
                                                    </p>
                                                    <p class="text-sm text-gray-400">
                                                        <c:out value="${consultation.patient.email}"/>
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-8 h-8 rounded-full bg-blue-600 flex items-center justify-center text-white text-sm font-semibold">
                                                    ${consultation.doctor.firstName.substring(0,1).toUpperCase()}${consultation.doctor.lastName.substring(0,1).toUpperCase()}
                                                </div>
                                                <div>
                                                    <p class="text-white font-medium">
                                                        Dr. <c:out value="${consultation.doctor.firstName} ${consultation.doctor.lastName}"/>
                                                    </p>
                                                    <p class="text-sm text-gray-400">
                                                        <c:out value="${consultation.doctor.speciality}"/>
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-4">
                                            <div class="text-gray-300">
                                                <p class="font-medium">
<%--                                                    <fmt:formatDate value="${consultation.startTime}" pattern="dd/MM/yyyy"/>--%>
                                                </p>
                                                <p class="text-sm text-gray-400">
<%--                                                    <fmt:formatDate value="${consultation.startTime}" pattern="HH:mm"/> ---%>
<%--                                                    <fmt:formatDate value="${consultation.endTime}" pattern="HH:mm"/>--%>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-4 py-4">
                                            <c:choose>
                                                <c:when test="${consultation.consultationStatus == 'COMPLETED'}">
                                                    <span class="inline-block px-3 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                                        Completed
                                                    </span>
                                                </c:when>
                                                <c:when test="${consultation.consultationStatus == 'VALIDATED'}">
                                                    <span class="inline-block px-3 py-1 text-xs rounded bg-blue-900 text-blue-300 border border-blue-700">
                                                        Validated
                                                    </span>
                                                </c:when>
                                                <c:when test="${consultation.consultationStatus == 'RESERVED'}">
                                                    <span class="inline-block px-3 py-1 text-xs rounded bg-yellow-900 text-yellow-300 border border-yellow-700">
                                                        Reserved
                                                    </span>
                                                </c:when>
<%--                                                <c:when test="${consultation.consultationStatus == 'CANCELED'}">--%>
<%--                                                    <span class="inline-block px-3 py-1 text-xs rounded bg-red-900 text-red-300 border border-red-700">--%>
<%--                                                        Cancelled--%>
<%--                                                    </span>--%>
<%--                                                </c:when>--%>
                                            </c:choose>
                                        </td>
                                        <td class="px-4 py-4 text-gray-300 max-w-xs truncate">
                                            <c:out value="${consultation.reason}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>
