<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- Doctor Dashboard Content -->
<div class="space-y-6">

    <!-- Welcome Section -->
    <div class="bg-gradient-to-r from-blue-900 to-blue-800 rounded-lg p-6 border border-blue-700">
        <div class="flex items-center justify-between">
            <div>
                <h2 class="text-2xl font-bold text-white mb-2">
                    Welcome back, Dr.
                    <!-- TODO: Get from servlet - ${doctor.firstName} ${doctor.lastName} -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                        </c:when>
                        <c:otherwise>John Smith</c:otherwise>
                    </c:choose>
                </h2>
                <p class="text-blue-200">Here's your overview for today</p>
            </div>
            <div class="hidden md:block">
                <svg class="h-16 w-16 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
        <!-- Today's Appointments -->
        <div class="bg-gray-800 rounded-lg p-6 border border-gray-700">
            <div class="flex items-center justify-between mb-4">
                <div class="bg-blue-900 p-3 rounded-lg">
                    <svg class="h-6 w-6 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                </div>
            </div>
            <div>
                <p class="text-gray-400 text-sm mb-1">Today's Appointments</p>
                <!-- TODO: Get from servlet - ${todayAppointments} -->
                <p class="text-3xl font-bold text-white">8</p>
            </div>
        </div>

        <!-- Pending Validations -->
        <div class="bg-gray-800 rounded-lg p-6 border border-gray-700">
            <div class="flex items-center justify-between mb-4">
                <div class="bg-yellow-900 p-3 rounded-lg">
                    <svg class="h-6 w-6 text-yellow-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
            <div>
                <p class="text-gray-400 text-sm mb-1">Pending Validations</p>
                <!-- TODO: Get from servlet - ${pendingValidations} -->
                <p class="text-3xl font-bold text-white">5</p>
            </div>
        </div>

        <!-- Completed Today -->
        <div class="bg-gray-800 rounded-lg p-6 border border-gray-700">
            <div class="flex items-center justify-between mb-4">
                <div class="bg-green-900 p-3 rounded-lg">
                    <svg class="h-6 w-6 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
            <div>
                <p class="text-gray-400 text-sm mb-1">Completed Today</p>
                <!-- TODO: Get from servlet - ${completedToday} -->
                <p class="text-3xl font-bold text-white">3</p>
            </div>
        </div>

        <!-- Total Patients -->
        <div class="bg-gray-800 rounded-lg p-6 border border-gray-700">
            <div class="flex items-center justify-between mb-4">
                <div class="bg-purple-900 p-3 rounded-lg">
                    <svg class="h-6 w-6 text-purple-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                </div>
            </div>
            <div>
                <p class="text-gray-400 text-sm mb-1">Total Patients</p>
                <!-- TODO: Get from servlet - ${totalPatients} -->
                <p class="text-3xl font-bold text-white">142</p>
            </div>
        </div>
    </div>

    <!-- Two Column Layout -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

        <!-- Personal Information Section (Left - 1 column) -->
        <div class="lg:col-span-1">
            <div class="bg-gray-800 rounded-lg border border-gray-700">
                <div class="px-6 py-4 border-b border-gray-700">
                    <h3 class="text-lg font-semibold text-white">Personal Information</h3>
                </div>
                <div class="p-6 space-y-4">
                    <!-- Profile Picture -->
                    <div class="flex justify-center mb-6">
                        <div class="w-24 h-24 rounded-full bg-blue-600 flex items-center justify-center text-white text-3xl font-bold">
                            <!-- TODO: Get from servlet - ${doctor.firstName.substring(0,1)}${doctor.lastName.substring(0,1)} -->
                            JS
                        </div>
                    </div>

                    <!-- Doctor Details -->
                    <div class="space-y-3">
                        <div>
                            <label class="text-xs text-gray-400 uppercase tracking-wide">Full Name</label>
                            <p class="text-white font-medium mt-1">
                                <!-- TODO: Get from servlet - ${doctor.firstName} ${doctor.lastName} -->
                                Dr. John Smith
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400 uppercase tracking-wide">Speciality</label>
                            <p class="text-white font-medium mt-1">
                                <!-- TODO: Get from servlet - ${doctor.speciality} -->
                                Cardiology
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400 uppercase tracking-wide">Email</label>
                            <p class="text-white font-medium mt-1 break-all">
                                <!-- TODO: Get from servlet - ${doctor.email} -->
                                john.smith@clinic.com
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400 uppercase tracking-wide">Department</label>
                            <p class="text-white font-medium mt-1">
                                <!-- TODO: Get from servlet - ${doctor.department.name} -->
                                Cardiovascular Department
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400 uppercase tracking-wide">Room Number</label>
                            <p class="text-white font-medium mt-1">
                                <!-- TODO: Get from servlet - ${doctor.room.roomNumber} -->
                                Room 204
                            </p>
                        </div>

                        <div>
                            <label class="text-xs text-gray-400 uppercase tracking-wide">Member Since</label>
                            <p class="text-white font-medium mt-1">
                                <!-- TODO: Get from servlet - format ${doctor.createdAt} -->
                                January 2023
                            </p>
                        </div>
                    </div>

                    <!-- Edit Profile Button -->
                    <div class="pt-4">
                        <a href="${pageContext.request.contextPath}/doctor/profile/edit"
                           class="block w-full text-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                            Edit Profile
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Consultations Section (Right - 2 columns) -->
        <div class="lg:col-span-2">
            <div class="bg-gray-800 rounded-lg border border-gray-700">
                <div class="px-6 py-4 border-b border-gray-700 flex items-center justify-between">
                    <h3 class="text-lg font-semibold text-white">Recent Consultations</h3>
                    <a href="${pageContext.request.contextPath}/doctor/consultations"
                       class="text-sm text-blue-400 hover:text-blue-300 transition">
                        View All →
                    </a>
                </div>
                <div class="p-6">
                    <!-- TODO: Loop through consultations from servlet - <c:forEach var="consultation" items="${recentConsultations}"> -->

                    <!-- Consultation Item 1 -->
                    <div class="mb-4 pb-4 border-b border-gray-700 last:border-b-0 last:mb-0 last:pb-0">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                    <!-- TODO: Get initials from ${consultation.patient.firstName} ${consultation.patient.lastName} -->
                                    AM
                                </div>
                                <div>
                                    <h4 class="text-white font-medium">
                                        <!-- TODO: Get from servlet - ${consultation.patient.firstName} ${consultation.patient.lastName} -->
                                        Alice Morrison
                                    </h4>
                                    <p class="text-sm text-gray-400">
                                        <!-- TODO: Get from servlet - ${consultation.patient.email} -->
                                        alice.morrison@email.com
                                    </p>
                                </div>
                            </div>
                            <div class="text-right">
                                <!-- TODO: Get from servlet - format ${consultation.consultationDate} -->
                                <p class="text-sm text-gray-400">Today, 10:30 AM</p>
                                <!-- TODO: Get status from servlet - ${consultation.status} -->
                                <span class="inline-block mt-1 px-2 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                    Completed
                                </span>
                            </div>
                        </div>
                        <div class="ml-13">
                            <p class="text-sm text-gray-300">
                                <!-- TODO: Get from servlet - ${consultation.medicalReport} -->
                                Patient complained of chest pain. ECG performed. Prescribed medication for hypertension.
                            </p>
                        </div>
                    </div>

                    <!-- Consultation Item 2 -->
                    <div class="mb-4 pb-4 border-b border-gray-700 last:border-b-0 last:mb-0 last:pb-0">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                    RJ
                                </div>
                                <div>
                                    <h4 class="text-white font-medium">Robert Johnson</h4>
                                    <p class="text-sm text-gray-400">robert.j@email.com</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-sm text-gray-400">Today, 09:00 AM</p>
                                <span class="inline-block mt-1 px-2 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                    Completed
                                </span>
                            </div>
                        </div>
                        <div class="ml-13">
                            <p class="text-sm text-gray-300">
                                Routine checkup. Blood pressure normal. Advised to continue current medication.
                            </p>
                        </div>
                    </div>

                    <!-- Consultation Item 3 -->
                    <div class="mb-4 pb-4 border-b border-gray-700 last:border-b-0 last:mb-0 last:pb-0">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                    SW
                                </div>
                                <div>
                                    <h4 class="text-white font-medium">Sarah Williams</h4>
                                    <p class="text-sm text-gray-400">sarah.w@email.com</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-sm text-gray-400">Yesterday, 03:45 PM</p>
                                <span class="inline-block mt-1 px-2 py-1 text-xs rounded bg-blue-900 text-blue-300 border border-blue-700">
                                    Validated
                                </span>
                            </div>
                        </div>
                        <div class="ml-13">
                            <p class="text-sm text-gray-300">
                                Follow-up appointment scheduled. Monitoring heart rhythm. Patient responding well to treatment.
                            </p>
                        </div>
                    </div>

                    <!-- Consultation Item 4 -->
                    <div class="mb-4 pb-4 border-b border-gray-700 last:border-b-0 last:mb-0 last:pb-0">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                    MB
                                </div>
                                <div>
                                    <h4 class="text-white font-medium">Michael Brown</h4>
                                    <p class="text-sm text-gray-400">michael.brown@email.com</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-sm text-gray-400">Yesterday, 02:15 PM</p>
                                <span class="inline-block mt-1 px-2 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                    Completed
                                </span>
                            </div>
                        </div>
                        <div class="ml-13">
                            <p class="text-sm text-gray-300">
                                Initial consultation for cardiac assessment. Tests ordered. Patient advised on lifestyle changes.
                            </p>
                        </div>
                    </div>

                    <!-- Consultation Item 5 -->
                    <div class="mb-4 pb-4 border-b border-gray-700 last:border-b-0 last:mb-0 last:pb-0">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 rounded-full bg-purple-600 flex items-center justify-center text-white font-semibold">
                                    ED
                                </div>
                                <div>
                                    <h4 class="text-white font-medium">Emma Davis</h4>
                                    <p class="text-sm text-gray-400">emma.davis@email.com</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-sm text-gray-400">Oct 16, 04:30 PM</p>
                                <span class="inline-block mt-1 px-2 py-1 text-xs rounded bg-green-900 text-green-300 border border-green-700">
                                    Completed
                                </span>
                            </div>
                        </div>
                        <div class="ml-13">
                            <p class="text-sm text-gray-300">
                                Post-surgery follow-up. Recovery progressing well. Next appointment in 2 weeks.
                            </p>
                        </div>
                    </div>

                    <!-- TODO: End forEach loop -->

                    <!-- View All Button -->
                    <div class="mt-6 pt-4 border-t border-gray-700">
                        <a href="${pageContext.request.contextPath}/doctor/consultations"
                           class="block w-full text-center px-4 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition font-medium">
                            View All Consultations
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

