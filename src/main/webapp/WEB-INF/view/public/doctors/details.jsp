<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dr. ${doctor.firstName} ${doctor.lastName} - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css" />
</head>
<body class="bg-gray-900 text-gray-100">

    <!-- Include Header/Navigation -->
    <jsp:include page="/WEB-INF/view/common/header.jsp" />

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">

        <!-- Success/Error Messages -->
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="bg-green-900 bg-opacity-50 border border-green-600 text-green-300 px-4 py-3 rounded-lg mb-4">
                ${sessionScope.successMessage}
            </div>
            <c:remove var="successMessage" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="bg-red-900 bg-opacity-50 border border-red-600 text-red-300 px-4 py-3 rounded-lg mb-4">
                ${sessionScope.errorMessage}
            </div>
            <c:remove var="errorMessage" scope="session"/>
        </c:if>

        <!-- Back Button -->
        <div class="mb-6">
            <a href="${pageContext.request.contextPath}/doctors"
               class="inline-flex items-center space-x-2 text-blue-400 hover:text-blue-300 transition">
                <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                </svg>
                <span>Back to Doctors List</span>
            </a>
        </div>

        <!-- Doctor Profile Section -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            <!-- Left Column - Doctor Info -->
            <div class="lg:col-span-1 space-y-6">

                <!-- Doctor Card -->
                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <!-- Doctor Avatar -->
                    <div class="w-32 h-32 bg-blue-600 rounded-full flex items-center justify-center mx-auto mb-4">
                        <span class="text-4xl font-bold text-white">
                            ${doctor.firstName.substring(0, 1).toUpperCase()}${doctor.lastName.substring(0, 1).toUpperCase()}
                        </span>
                    </div>

                    <div class="text-center mb-4">
                        <h1 class="text-2xl font-bold text-white mb-1">Dr. ${doctor.firstName} ${doctor.lastName}</h1>
                        <p class="text-blue-400 text-lg">${doctor.speciality}</p>
                    </div>

                    <div class="border-t border-gray-700 pt-4 space-y-3">
                        <div class="flex items-center text-sm text-gray-300">
                            <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                            </svg>
                            <span>${doctor.departmentName} Department</span>
                        </div>

                        <div class="flex items-center text-sm text-gray-300">
                            <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                            <span>Room ${doctor.roomNumber}</span>
                        </div>

                        <div class="flex items-center text-sm text-gray-300">
                            <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                            <span>${doctor.email}</span>
                        </div>

                        <c:if test="${not empty doctor.phone}">
                            <div class="flex items-center text-sm text-gray-300">
                                <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                </svg>
                                <span>${doctor.phone}</span>
                            </div>
                        </c:if>

                        <c:if test="${not empty doctor.consultationCount}">
                            <div class="flex items-center text-sm text-gray-300">
                                <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                                <span>${doctor.consultationCount} Consultations</span>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Working Hours -->
                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <h3 class="text-lg font-semibold text-white mb-4">Working Hours</h3>
                    <div class="space-y-2 text-sm">
                        <div class="flex justify-between">
                            <span class="text-gray-400">Monday - Friday</span>
                            <span class="text-white font-medium">9:00 AM - 5:00 PM</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-gray-400">Lunch Break</span>
                            <span class="text-white font-medium">12:00 PM - 1:00 PM</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-gray-400">Weekend</span>
                            <span class="text-red-400 font-medium">Closed</span>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Right Column - About & Booking -->
            <div class="lg:col-span-2 space-y-6">

                <!-- About Doctor -->
                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <h2 class="text-xl font-semibold text-white mb-4">About Dr. ${doctor.lastName}</h2>
                    <p class="text-gray-300 leading-relaxed">
                        Dr. ${doctor.firstName} ${doctor.lastName} is a specialist in ${doctor.speciality} at the ${doctor.departmentName} Department.
                        With a commitment to excellence and patient care, Dr. ${doctor.lastName} provides comprehensive medical services
                        using the latest medical technology and evidence-based practices.
                    </p>
                </div>

                <!-- Book Appointment Section -->
                <div class="bg-gray-800 border border-gray-700 rounded-lg p-6">
                    <h2 class="text-xl font-semibold text-white mb-4">Book an Appointment</h2>

                    <form id="bookingForm" method="POST" action="${pageContext.request.contextPath}/doctors/${doctor.id}">
                        <!-- Date Selection -->
                        <div class="mb-6">
                            <label for="appointmentDate" class="block text-sm font-medium text-gray-300 mb-2">Select Date</label>
                            <input type="date"
                                   id="appointmentDate"
                                   name="appointmentDate"
                                   required
                                   min="2025-10-20"
                                   class="w-full bg-gray-700 border border-gray-600 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-blue-600">
                        </div>

                        <!-- Available Time Slots -->
                        <div class="mb-4">
                            <h3 class="text-sm font-medium text-gray-300 mb-3">Available Time Slots</h3>

                            <!-- Hidden field for selected time -->
                            <input type="hidden" id="selectedStartTime" name="startTime" required>

                            <!-- Morning Slots -->
                            <div class="mb-4">
                                <p class="text-xs text-gray-400 mb-2 uppercase tracking-wide">Morning (9:00 AM - 12:00 PM)</p>
                                <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-2">
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="09:00">
                                        09:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="09:30">
                                        09:30
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="10:00">
                                        10:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="10:30">
                                        10:30
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="11:00">
                                        11:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="11:30">
                                        11:30
                                    </button>
                                </div>
                            </div>

                            <!-- Lunch Break -->
                            <div class="mb-4">
                                <div class="bg-yellow-900 bg-opacity-30 border border-yellow-600 rounded-lg p-3 text-center">
                                    <span class="text-yellow-400 text-sm">🍽️ Lunch Break (12:00 PM - 1:00 PM)</span>
                                </div>
                            </div>

                            <!-- Afternoon Slots -->
                            <div class="mb-4">
                                <p class="text-xs text-gray-400 mb-2 uppercase tracking-wide">Afternoon (1:00 PM - 5:00 PM)</p>
                                <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-2">
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="13:00">
                                        13:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="13:30">
                                        13:30
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="14:00">
                                        14:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="14:30">
                                        14:30
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="15:00">
                                        15:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="15:30">
                                        15:30
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="16:00">
                                        16:00
                                    </button>
                                    <button type="button" class="time-slot bg-gray-700 hover:bg-blue-600 border border-gray-600 hover:border-blue-500 text-white px-3 py-2 rounded text-sm transition" data-time="16:30">
                                        16:30
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Selected Time Display -->
                        <div id="selectedTime" class="hidden mb-4 bg-blue-900 bg-opacity-30 border border-blue-600 rounded-lg p-4">
                            <p class="text-blue-300 text-sm">
                                <strong>Selected:</strong> <span id="selectedTimeText"></span>
                            </p>
                        </div>

                        <!-- Reason for Visit -->
                        <div class="mb-4">
                            <label for="reason" class="block text-sm font-medium text-gray-300 mb-2">Reason for Visit</label>
                            <textarea id="reason"
                                      name="reason"
                                      rows="4"
                                      required
                                      placeholder="Please describe your symptoms or reason for the appointment..."
                                      class="w-full bg-gray-700 border border-gray-600 text-white rounded-lg px-4 py-3 focus:outline-none focus:border-blue-600"></textarea>
                        </div>

                        <!-- Book Button -->
                        <button type="button"
                                onclick="showBookingModal()"
                                class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-lg transition">
                            Confirm Booking
                        </button>

                        <!-- Info Note -->
                        <div class="mt-4 bg-gray-700 border border-gray-600 rounded-lg p-4">
                            <div class="flex items-start space-x-3">
                                <svg class="h-5 w-5 text-blue-400 flex-shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                                <div class="text-sm text-gray-300">
                                    <p class="font-medium mb-1">Please Note:</p>
                                    <ul class="list-disc list-inside space-y-1 text-xs text-gray-400">
                                        <li>You must be logged in to book an appointment</li>
                                        <li>Appointments are subject to doctor confirmation</li>
                                        <li>You will receive a confirmation email once the doctor validates your booking</li>
                                        <li>Cancellations must be made at least 24 hours in advance</li>
                                        <li>Each consultation slot is 30 minutes</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>

        </div>

    </main>

    <!-- Include Footer -->
    <jsp:include page="/WEB-INF/view/common/footer.jsp" />

    <!-- Booking Confirmation Modal -->
    <div id="bookingModal" class="hidden fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
        <div class="bg-gray-800 rounded-lg max-w-md w-full border border-gray-700">
            <div class="px-6 py-4 border-b border-gray-700">
                <h3 class="text-xl font-bold text-white">Confirm Appointment</h3>
            </div>
            <div class="px-6 py-4">
                <div class="space-y-4">
                    <div>
                        <p class="text-sm text-gray-400">Doctor</p>
                        <p class="text-white font-medium">Dr. ${doctor.firstName} ${doctor.lastName}</p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-400">Specialty</p>
                        <p class="text-white font-medium">${doctor.speciality}</p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-400">Date & Time</p>
                        <p class="text-white font-medium" id="modalDateTime">Please select a time slot</p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-400">Room</p>
                        <p class="text-white font-medium">Room ${doctor.roomNumber}</p>
                    </div>
                    <div>
                        <p class="text-sm text-gray-400">Reason</p>
                        <p class="text-white font-medium" id="modalReason"></p>
                    </div>
                    <div class="bg-blue-900 bg-opacity-30 border border-blue-600 rounded-lg p-3">
                        <p class="text-blue-300 text-sm">
                            Your appointment request will be sent to the doctor for confirmation.
                            You will receive an email notification once confirmed.
                        </p>
                    </div>
                </div>
            </div>
            <div class="px-6 py-4 border-t border-gray-700 flex justify-end space-x-3">
                <button type="button"
                        onclick="closeBookingModal()"
                        class="px-6 py-2 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition">
                    Cancel
                </button>
                <button type="button"
                        onclick="confirmBooking()"
                        class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition">
                    Confirm Booking
                </button>
            </div>
        </div>
    </div>

    <script>
        // Store selected time globally
        let selectedStartTime = null;
        let selectedEndTime = null;

        // Function to calculate end time (30 minutes after start)
        function calculateEndTime(startTime) {
            const [hours, minutes] = startTime.split(':').map(Number);
            let endMinutes = minutes + 30;
            let endHours = hours;

            if (endMinutes >= 60) {
                endMinutes -= 60;
                endHours += 1;
            }

            return String(endHours).padStart(2, '0') + ':' + String(endMinutes).padStart(2, '0');
        }

        // Time slot selection
        document.querySelectorAll('.time-slot').forEach(button => {
            button.addEventListener('click', function() {
                // Remove previous selection
                document.querySelectorAll('.time-slot').forEach(btn => {
                    btn.classList.remove('bg-blue-600', 'border-blue-500');
                    btn.classList.add('bg-gray-700', 'border-gray-600');
                });

                // Add selection to clicked buttontime-slot
                this.classList.remove('bg-gray-700', 'border-gray-600');
                this.classList.add('bg-blue-600', 'border-blue-500');

                // Store selected start time and calculate end time
                selectedStartTime = this.getAttribute('data-time');
                selectedEndTime = calculateEndTime(selectedStartTime);

                // Update hidden form field
                document.getElementById('selectedStartTime').value = selectedStartTime;

                // Show selected time with start and end
                const selectedTimeDiv = document.getElementById('selectedTime');
                const selectedTimeText = document.getElementById('selectedTimeText');
                const dateInput = document.getElementById('appointmentDate');

                selectedTimeDiv.classList.remove('hidden');
                if (dateInput.value) {
                    selectedTimeText.textContent = dateInput.value + ' from ' + selectedStartTime + ' to ' + selectedEndTime;
                } else {
                    selectedTimeText.textContent = 'Time: ' + selectedStartTime + ' to ' + selectedEndTime;
                }
            });
        });

        // Update selected time display when date changes
        document.getElementById('appointmentDate').addEventListener('change', function() {
            if (selectedStartTime) {
                const selectedTimeText = document.getElementById('selectedTimeText');
                selectedTimeText.textContent = this.value + ' from ' + selectedStartTime + ' to ' + selectedEndTime;
            }
        });

        // Modal functions
        function showBookingModal() {
            const dateInput = document.getElementById('appointmentDate');
            const reasonInput = document.getElementById('reason');

            // Validate form
            if (!dateInput.value) {
                alert('Please select a date for your appointment.');
                dateInput.focus();
                return;
            }

            if (!selectedStartTime) {
                alert('Please select a time slot.');
                return;
            }

            if (!reasonInput.value.trim()) {
                alert('Please provide a reason for your visit.');
                reasonInput.focus();
                return;
            }

            // Update modal with selected information
            document.getElementById('modalDateTime').textContent = dateInput.value + ' from ' + selectedStartTime + ' to ' + selectedEndTime;
            document.getElementById('modalReason').textContent = reasonInput.value;

            // Show modal
            document.getElementById('bookingModal').classList.remove('hidden');
        }

        function closeBookingModal() {
            document.getElementById('bookingModal').classList.add('hidden');
        }

        function confirmBooking() {
            // Submit the form
            document.getElementById('bookingForm').submit();
        }

        // Close modal when clicking outside
        document.getElementById('bookingModal').addEventListener('click', function(event) {
            if (event.target === this) {
                closeBookingModal();
            }
        });

        // Close modal on escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeBookingModal();
            }
        });
    </script>

</body>
</html>

