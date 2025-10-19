<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- Schedule Content -->
<div class="space-y-6">

    <!-- Back Button -->
    <div>
        <a href="${pageContext.request.contextPath}/admin/doctors/${param.doctorId != null ? param.doctorId : doctor.id}"
           class="inline-flex items-center space-x-2 text-blue-400 hover:text-blue-300 transition">
            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
            </svg>
            <span>Back to Doctor Details</span>
        </a>
    </div>

    <!-- Doctor Info Card -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <div class="flex items-center gap-4">
            <div class="w-16 h-16 bg-blue-600 rounded-full flex items-center justify-center">
                <span class="text-xl font-bold text-white">
                    <c:choose>
                        <c:when test="${not empty doctor}">
                            ${doctor.firstName.substring(0,1).toUpperCase()}${doctor.lastName.substring(0,1).toUpperCase()}
                        </c:when>
                        <c:otherwise>JD</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div>
                <h2 class="text-xl font-semibold text-white">
                    <c:choose>
                        <c:when test="${not empty doctor}">
                            Dr. <c:out value="${doctor.firstName}" /> <c:out value="${doctor.lastName}" />
                        </c:when>
                        <c:otherwise>Dr. John Doe</c:otherwise>
                    </c:choose>
                </h2>
                <p class="text-gray-400">
                    <c:choose>
                        <c:when test="${not empty doctor}">
                            <c:out value="${doctor.speciality}" /> - Room ${doctor.roomNumber}
                        </c:when>
                        <c:otherwise>Cardiologist - Room 101</c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>
    </div>

    <!-- Date Selection Form -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
        <h3 class="text-lg font-semibold text-white mb-4">Select Date</h3>
        <form method="GET" action="${pageContext.request.contextPath}/admin/doctors/${param.doctorId != null ? param.doctorId : doctor.id}/schedule">
            <div class="flex gap-4 items-end">
                <div class="flex-1">
                    <label class="block text-sm text-gray-400 mb-2">Working Date</label>
                    <input type="date" name="date"
                           value="${param.date != null ? param.date : selectedDate}"
                           min="<jsp:useBean id="now" class="java.util.Date"/><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>"
                           class="w-full bg-gray-700 border border-gray-600 text-white rounded px-4 py-2 focus:outline-none focus:border-blue-600">
                </div>
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded transition">
                    View Schedule
                </button>
            </div>
        </form>
    </div>

    <!-- Schedule for Selected Day -->
    <c:choose>
        <c:when test="${not empty slots}">
            <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                <h3 class="text-lg font-semibold text-white mb-4">
                    Time Slots - <fmt:formatDate value="${selectedDateObj}" pattern="EEEE, MMMM dd, yyyy"/>
                </h3>
                <p class="text-sm text-gray-400 mb-6">
                    Working Hours: 9:00 AM - 5:00 PM (30-minute slots) | Lunch Break: 12:00 PM - 1:00 PM
                </p>

                <!-- Morning Slots -->
                <div class="mb-6">
                    <h4 class="text-md font-semibold text-blue-400 mb-3">Morning Slots (9:00 AM - 12:00 PM)</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                        <c:forEach items="${slots}" var="slot">
                            <c:set var="hour" value="${slot.startTime.hour}"/>
                            <c:if test="${hour >= 9 && hour < 12}">
                                <div class="bg-gray-700 border ${slot.isAvailable && slot.consultation == null ? 'border-green-600' : 'border-red-600'} rounded-lg p-4">
                                    <div class="flex items-center justify-between mb-2">
                                        <span class="text-white font-semibold">
                                            ${String.format("%02d:%02d", slot.startTime.hour, slot.startTime.minute)} -
                                            ${String.format("%02d:%02d", slot.endTime.hour, slot.endTime.minute)}
                                        </span>
                                        <c:choose>
                                            <c:when test="${slot.isAvailable && slot.consultation == null}">
                                                <span class="bg-green-600 text-white text-xs px-2 py-1 rounded">Available</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="bg-red-600 text-white text-xs px-2 py-1 rounded">Booked</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <p class="text-gray-400 text-sm">
                                        <c:choose>
                                            <c:when test="${slot.consultation != null}">
                                                Patient: <c:out value="${slot.consultation.patient.firstName}" /> <c:out value="${slot.consultation.patient.lastName}" />
                                            </c:when>
                                            <c:otherwise>No appointment</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <!-- Lunch Break -->
                <div class="mb-6">
                    <div class="bg-yellow-900 bg-opacity-30 border border-yellow-600 rounded-lg p-4 text-center">
                        <span class="text-yellow-400 font-semibold">🍽️ Lunch Break (12:00 PM - 1:00 PM)</span>
                    </div>
                </div>

                <!-- Afternoon Slots -->
                <div class="mb-6">
                    <h4 class="text-md font-semibold text-blue-400 mb-3">Afternoon Slots (1:00 PM - 5:00 PM)</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                        <c:forEach items="${slots}" var="slot">
                            <c:set var="hour" value="${slot.startTime.hour}"/>
                            <c:if test="${hour >= 13 && hour < 17}">
                                <div class="bg-gray-700 border ${slot.isAvailable && slot.consultation == null ? 'border-green-600' : 'border-red-600'} rounded-lg p-4">
                                    <div class="flex items-center justify-between mb-2">
                                        <span class="text-white font-semibold">
                                            ${String.format("%02d:%02d", slot.startTime.hour, slot.startTime.minute)} -
                                            ${String.format("%02d:%02d", slot.endTime.hour, slot.endTime.minute)}
                                        </span>
                                        <c:choose>
                                            <c:when test="${slot.isAvailable && slot.consultation == null}">
                                                <span class="bg-green-600 text-white text-xs px-2 py-1 rounded">Available</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="bg-red-600 text-white text-xs px-2 py-1 rounded">Booked</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <p class="text-gray-400 text-sm">
                                        <c:choose>
                                            <c:when test="${slot.consultation != null}">
                                                Patient: <c:out value="${slot.consultation.patient.firstName}" /> <c:out value="${slot.consultation.patient.lastName}" />
                                            </c:when>
                                            <c:otherwise>No appointment</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <!-- Summary Statistics -->
                <div class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="bg-gray-700 rounded-lg p-4 text-center">
                        <p class="text-2xl font-bold text-white">${totalSlots}</p>
                        <p class="text-gray-400 text-sm">Total Slots</p>
                    </div>
                    <div class="bg-gray-700 rounded-lg p-4 text-center">
                        <p class="text-2xl font-bold text-green-600">${availableSlots}</p>
                        <p class="text-gray-400 text-sm">Available Slots</p>
                    </div>
                    <div class="bg-gray-700 rounded-lg p-4 text-center">
                        <p class="text-2xl font-bold text-red-600">${bookedSlots}</p>
                        <p class="text-gray-400 text-sm">Booked Slots</p>
                    </div>
                </div>

            </div>
        </c:when>
        <c:otherwise>
            <!-- No Slots Found or Date Not Selected -->
            <div class="bg-gray-800 border border-gray-700 rounded-lg p-12 text-center">
                <svg class="mx-auto h-16 w-16 text-gray-600 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                </svg>
                <h3 class="text-xl font-semibold text-white mb-2">
                    <c:choose>
                        <c:when test="${param.date != null}">No Slots Available</c:when>
                        <c:otherwise>Select a Date to View Schedule</c:otherwise>
                    </c:choose>
                </h3>
                <p class="text-gray-400">
                    <c:choose>
                        <c:when test="${param.date != null}">
                            No consultation slots have been generated for this date. Please generate slots first.
                        </c:when>
                        <c:otherwise>
                            Please select a date from the picker above to view the doctor's schedule.
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </c:otherwise>
    </c:choose>

</div>
