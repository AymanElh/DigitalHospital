<%--
  Created by IntelliJ IDEA.
  User: ayman-elh
  Date: 10/19/25
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Doctors - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css"/>
</head>
<body class="bg-gray-900 text-gray-100">

<!-- Include Header/Navigation -->
<jsp:include page="/WEB-INF/view/common/header.jsp"/>

<!-- Main Content -->
<main class="container mx-auto px-4 py-8">

    <!-- Page Header -->
    <div class="mb-8">
        <h1 class="text-3xl font-bold text-white mb-2">Our Doctors</h1>
        <p class="text-gray-400">Find and book appointments with our experienced medical professionals</p>
    </div>

    <!-- Filters Section -->
    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6 mb-8">
        <h2 class="text-lg font-semibold text-white mb-4">Filter Doctors</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <!-- Department Filter -->
            <div>
                <label class="block text-sm text-gray-400 mb-2">Department</label>
                <select class="w-full bg-gray-700 border border-gray-600 text-white rounded px-4 py-2 focus:outline-none focus:border-blue-600">
                    <option value="">All Departments</option>
                    <option value="cardiology">Cardiology</option>
                    <option value="neurology">Neurology</option>
                    <option value="orthopedics">Orthopedics</option>
                    <option value="pediatrics">Pediatrics</option>
                    <option value="general">General Medicine</option>
                </select>
            </div>

            <!-- Specialty Filter -->
            <div>
                <label class="block text-sm text-gray-400 mb-2">Specialty</label>
                <select class="w-full bg-gray-700 border border-gray-600 text-white rounded px-4 py-2 focus:outline-none focus:border-blue-600">
                    <option value="">All Specialties</option>
                    <option value="heart">Heart Surgeon</option>
                    <option value="brain">Brain Specialist</option>
                    <option value="bones">Bone Specialist</option>
                    <option value="child">Child Specialist</option>
                </select>
            </div>

            <!-- Search -->
            <div>
                <label class="block text-sm text-gray-400 mb-2">Search</label>
                <input type="text" placeholder="Doctor name..."
                       class="w-full bg-gray-700 border border-gray-600 text-white rounded px-4 py-2 focus:outline-none focus:border-blue-600">
            </div>
        </div>

        <div class="mt-4 flex gap-3">
            <button class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded transition">
                Apply Filters
            </button>
            <button class="bg-gray-700 hover:bg-gray-600 text-white px-6 py-2 rounded transition">
                Reset
            </button>
        </div>
    </div>

    <!-- Doctors Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

        <c:choose>
            <c:when test="${not empty doctors}">
                <c:forEach items="${doctors}" var="doctor">
                    <!-- Doctor Card -->
                    <div class="bg-gray-800 border border-gray-700 rounded-lg overflow-hidden hover:border-blue-600 transition">
                        <div class="p-6">
                            <!-- Doctor Avatar with initials -->
                            <div class="w-20 h-20 bg-blue-600 rounded-full flex items-center justify-center mb-4">
                                <span class="text-2xl font-bold text-white">
                                    ${doctor.firstName.substring(0,1).toUpperCase()}${doctor.lastName.substring(0,1).toUpperCase()}
                                </span>
                            </div>

                            <!-- Doctor Info -->
                            <h3 class="text-xl font-semibold text-white mb-1">
                                Dr. <c:out value="${doctor.firstName}" /> <c:out value="${doctor.lastName}" />
                            </h3>
                            <p class="text-blue-600 text-sm mb-3"><c:out value="${doctor.speciality}" /></p>

                            <div class="space-y-2 mb-4">
                                <!-- Department -->
                                <c:if test="${not empty doctor.departmentName}">
                                    <div class="flex items-center text-sm text-gray-400">
                                        <svg class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                                        </svg>
                                        <c:out value="${doctor.departmentName}" /> Department
                                    </div>
                                </c:if>

                                <!-- Email -->
                                <div class="flex items-center text-sm text-gray-400">
                                    <svg class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                                    </svg>
                                    <c:out value="${doctor.email}" />
                                </div>

                                <!-- Room -->
                                <c:if test="${not empty doctor.roomNumber}">
                                    <div class="flex items-center text-sm text-gray-400">
                                        <svg class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        </svg>
                                        Room <c:out value="${doctor.roomNumber}" />
                                    </div>
                                </c:if>

                                <!-- Consultations Count -->
                                <c:if test="${not empty doctor.consultationCount}">
                                    <div class="flex items-center text-sm text-gray-400">
                                        <svg class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                        ${doctor.consultationCount} consultations
                                    </div>
                                </c:if>
                            </div>

                            <p class="text-sm text-gray-400 mb-4">
                                Specialist in <c:out value="${doctor.speciality}" /> with expertise in patient care.
                            </p>

                            <a href="${pageContext.request.contextPath}/doctors/${doctor.id}"
                               class="block w-full bg-blue-600 hover:bg-blue-700 text-white text-center px-4 py-2 rounded transition">
                                View Profile & Book
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <!-- No Doctors Found Message -->
                <div class="col-span-full">
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-12 text-center">
                        <svg class="h-16 w-16 mx-auto text-gray-600 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        <h3 class="text-xl font-semibold text-white mb-2">No Doctors Found</h3>
                        <p class="text-gray-400">
                            There are currently no doctors available. Please check back later or contact our support team.
                        </p>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <!-- Pagination -->
    <div class="mt-8 flex justify-center">
        <div class="flex gap-2">
            <button class="bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded transition" disabled>
                Previous
            </button>
            <button class="bg-blue-600 text-white px-4 py-2 rounded">1</button>
            <button class="bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded transition">2</button>
            <button class="bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded transition">3</button>
            <button class="bg-gray-700 hover:bg-gray-600 text-white px-4 py-2 rounded transition">
                Next
            </button>
        </div>
    </div>

</main>

<!-- Include Footer -->
<jsp:include page="/WEB-INF/view/common/footer.jsp"/>

</body>
</html>
