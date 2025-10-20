<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Departments - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css"/>
</head>
<body class="bg-gray-900 text-gray-100">

<!-- Simple Header -->
<jsp:include page="../common/header.jsp" />
<!-- Main Content -->
<main class="container mx-auto px-4 py-12">
    <!-- Page Header -->
    <div class="text-center mb-12">
        <h1 class="text-4xl font-bold text-white mb-4">Our Departments</h1>
        <p class="text-gray-400 text-lg">Explore our specialized medical departments and find the right care for you</p>
    </div>

    <!-- Error Message -->
    <c:if test="${not empty errorMessage}">
        <div class="mb-6 bg-red-900 border border-red-600 text-red-100 px-4 py-3 rounded">
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>

    <!-- Departments Grid -->
    <c:choose>
        <c:when test="${empty departments}">
            <div class="text-center py-12">
                <svg class="mx-auto h-16 w-16 text-gray-600 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                </svg>
                <h3 class="text-xl font-medium text-gray-300 mb-2">No Departments Available</h3>
                <p class="text-gray-500">Please check back later for our department listings.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach var="department" items="${departments}">
                    <div class="bg-gray-800 border border-gray-700 rounded-lg p-6 hover:border-blue-500 transition">
                        <!-- Department Icon -->
                        <div class="flex items-center justify-center w-12 h-12 bg-blue-600 rounded-lg mb-4">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                            </svg>
                        </div>

                        <!-- Department Name -->
                        <h3 class="text-xl font-bold text-white mb-2">
                            <c:out value="${department.name}"/>
                        </h3>

                        <!-- Department Description -->
                        <p class="text-gray-400 mb-4">
                            <c:choose>
                                <c:when test="${not empty department.description}">
                                    <c:out value="${department.description}"/>
                                </c:when>
                                <c:otherwise>
                                    Specialized medical care and treatment
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <!-- Department Stats -->
                        <div class="flex items-center justify-between text-sm">
                            <div class="flex items-center space-x-1 text-gray-400">
                                <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                                </svg>
                                <span>
                                    <c:out value="${department.doctorCount != null ? department.doctorCount : 0}"/>
                                    Doctors
                                </span>
                            </div>
                            <a href="${pageContext.request.contextPath}/doctors?departmentId=${department.id}"
                               class="text-blue-400 hover:text-blue-300 transition">
                                View Doctors →
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<!-- Simple Footer -->
<jsp:include page="../common/footer.jsp"/>

</body>
</html>

