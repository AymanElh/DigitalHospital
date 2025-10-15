<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css" />
</head>
<body class="bg-gray-900 text-gray-100">

    <!-- Include Header/Navigation -->
    <jsp:include page="/WEB-INF/view/common/header.jsp" />

    <!-- Main Content -->
    <main>
        <!-- Success/Error Messages - Only show if they exist -->
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="container mx-auto px-4 mt-4">
                <div class="bg-green-900 border border-green-600 text-green-100 px-4 py-3 rounded">
                    <c:out value="${sessionScope.successMessage}" />
                </div>
            </div>
            <c:remove var="successMessage" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="container mx-auto px-4 mt-4">
                <div class="bg-red-900 border border-red-600 text-red-100 px-4 py-3 rounded">
                    <c:out value="${sessionScope.errorMessage}" />
                </div>
            </div>
            <c:remove var="errorMessage" scope="session"/>
        </c:if>

        <!-- Hero Section -->
        <section class="bg-gray-800 py-20 border-b border-gray-700">
            <div class="container mx-auto px-4">
                <div class="max-w-4xl mx-auto text-center">
                    <h1 class="text-4xl md:text-5xl font-bold text-white mb-6">
                        Welcome to Digital Clinic
                    </h1>
                    <p class="text-xl text-gray-400 mb-8">
                        Your health is our priority. Book appointments with our expert doctors,
                        manage your consultations and access your medical records with ease.
                    </p>
                    <div class="flex flex-col sm:flex-row gap-4 justify-center">
                        <a href="${pageContext.request.contextPath}/register"
                           class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded font-semibold transition">
                            Register
                        </a>
                        <a href="${pageContext.request.contextPath}/doctors"
                           class="bg-gray-700 hover:bg-gray-600 text-white px-8 py-3 rounded font-semibold transition">
                            Find a Doctor
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section class="py-16 bg-gray-900">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-bold text-center text-white mb-12">Our Services</h2>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mx-auto">

                    <!-- Service 1: Appointment Booking -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition">
                        <div class="bg-blue-600 w-12 h-12 rounded flex items-center justify-center mb-4">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-white mb-3">Easy Appointment Booking</h3>
                        <p class="text-gray-400">
                            Book appointments with your preferred doctors in just a few clicks.
                            Check availability and choose the time slot that suits you.
                        </p>
                    </div>

                    <!-- Service 2: Medical Records -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition">
                        <div class="bg-blue-600 w-12 h-12 rounded flex items-center justify-center mb-4">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-white mb-3">Medical Records</h3>
                        <p class="text-gray-400">
                            Access your complete medical history and consultation reports
                            anytime, anywhere. Everything is stored securely.
                        </p>
                    </div>

                    <!-- Service 3: Expert Doctors -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition">
                        <div class="bg-blue-600 w-12 h-12 rounded flex items-center justify-center mb-4">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-white mb-3">Expert Doctors</h3>
                        <p class="text-gray-400">
                            Our clinic features experienced doctors from various specialties
                            ready to provide quality healthcare services.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Statistics Section -->
        <section class="py-16 bg-gray-800 border-y border-gray-700">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-bold text-center text-white mb-12">Our Impact</h2>

                <!-- TODO: Get statistics from controller -->
                <!-- TODO: In HomeController.doGet(), add these attributes:
                     req.setAttribute("totalPatients", patientService.count());
                     req.setAttribute("totalDoctors", doctorService.count());
                     req.setAttribute("totalConsultations", consultationService.count());
                     req.setAttribute("totalDepartments", departmentService.count());
                -->

                <div class="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-4xl mx-auto">
                    <!-- Stat 1: Patients -->
                    <div class="text-center">
                        <!-- TODO: Replace with ${totalPatients}+ -->
                        <div class="text-4xl font-bold text-blue-600 mb-2">1,500+</div>
                        <div class="text-gray-400">Patients</div>
                    </div>

                    <!-- Stat 2: Doctors -->
                    <div class="text-center">
                        <!-- TODO: Replace with ${totalDoctors}+ -->
                        <div class="text-4xl font-bold text-blue-600 mb-2">50+</div>
                        <div class="text-gray-400">Doctors</div>
                    </div>

                    <!-- Stat 3: Consultations -->
                    <div class="text-center">
                        <!-- TODO: Replace with ${totalConsultations}+ -->
                        <div class="text-4xl font-bold text-blue-600 mb-2">5,000+</div>
                        <div class="text-gray-400">Consultations</div>
                    </div>

                    <!-- Stat 4: Departments -->
                    <div class="text-center">
                        <!-- TODO: Replace with ${totalDepartments}+ -->
                        <div class="text-4xl font-bold text-blue-600 mb-2">15+</div>
                        <div class="text-gray-400">Departments</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Departments Section -->
        <section class="py-16 bg-gray-900">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-bold text-center text-white mb-12">Our Departments</h2>

                <!-- TODO: Get departments list from controller -->
                <!-- TODO: In HomeController.doGet(), add:
                     List<Department> departments = departmentService.findAll();
                     req.setAttribute("departments", departments);
                -->

                <!-- TODO: Replace static cards with dynamic loop:
                     <c:forEach var="department" items="${departments}">
                         ... display each department ...
                     </c:forEach>
                -->

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">

                    <!-- Department Card 1 - Cardiology (Static example) -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition cursor-pointer">
                        <div class="text-blue-600 mb-3">
                            <svg class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                            </svg>
                        </div>
                        <!-- TODO: Display <c:out value="${department.name}" /> -->
                        <h3 class="text-lg font-semibold text-white mb-2">Cardiology</h3>
                        <!-- TODO: Display <c:out value="${department.description}" /> -->
                        <p class="text-sm text-gray-400 mb-3">Heart and cardiovascular care</p>
                        <!-- TODO: Count doctors - ${department.doctors.size()} -->
                        <p class="text-xs text-blue-600">8 Doctors</p>
                    </div>

                    <!-- Department Card 2 - Neurology (Static example) -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition cursor-pointer">
                        <div class="text-blue-600 mb-3">
                            <svg class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" />
                            </svg>
                        </div>
                        <h3 class="text-lg font-semibold text-white mb-2">Neurology</h3>
                        <p class="text-sm text-gray-400 mb-3">Brain and nervous system</p>
                        <p class="text-xs text-blue-600">6 Doctors</p>
                    </div>

                    <!-- Department Card 3 - Ophthalmology (Static example) -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition cursor-pointer">
                        <div class="text-blue-600 mb-3">
                            <svg class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        </div>
                        <h3 class="text-lg font-semibold text-white mb-2">Ophthalmology</h3>
                        <p class="text-sm text-gray-400 mb-3">Eye care and vision</p>
                        <p class="text-xs text-blue-600">5 Doctors</p>
                    </div>

                    <!-- Department Card 4 - General Medicine (Static example) -->
                    <div class="bg-gray-800 p-6 rounded border border-gray-700 hover:border-blue-600 transition cursor-pointer">
                        <div class="text-blue-600 mb-3">
                            <svg class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                            </svg>
                        </div>
                        <h3 class="text-lg font-semibold text-white mb-2">General Medicine</h3>
                        <p class="text-sm text-gray-400 mb-3">Primary healthcare</p>
                        <p class="text-xs text-blue-600">12 Doctors</p>
                    </div>
                </div>

                <!-- View All Button -->
                <div class="text-center mt-8">
                    <a href="${pageContext.request.contextPath}/departments"
                       class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded transition">
                        View All Departments
                    </a>
                </div>
            </div>
        </section>

        <!-- Call to Action Section -->
        <section class="py-16 bg-gray-800 border-t border-gray-700">
            <div class="container mx-auto px-4">
                <div class="max-w-3xl mx-auto text-center">
                    <h2 class="text-3xl font-bold text-white mb-4">Ready to Get Started?</h2>
                    <p class="text-xl text-gray-400 mb-8">
                        Join thousands of patients who trust Digital Clinic
                        for their healthcare needs.
                    </p>
                    <div class="flex flex-col sm:flex-row gap-4 justify-center">
                        <a href="${pageContext.request.contextPath}/register"
                           class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded font-semibold transition">
                            Register Now
                        </a>
                        <a href="${pageContext.request.contextPath}/doctors"
                           class="bg-gray-700 hover:bg-gray-600 text-white px-8 py-3 rounded font-semibold transition">
                            Book Appointment
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Include Footer -->
    <jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>
