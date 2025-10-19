<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Footer Component -->
<footer class="bg-gray-900 text-gray-300 border-t border-gray-800 mt-16">
    <div class="container mx-auto px-4 py-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

            <!-- About Section -->
            <div>
                <h3 class="text-white text-lg font-bold mb-4">Digital Clinic</h3>
                <p class="text-sm text-gray-400">
                    A modern clinic management system providing quality medical services
                    with easy appointment booking and consultation management.
                </p>
            </div>

            <!-- Quick Links -->
            <div>
                <h3 class="text-white text-lg font-bold mb-4">Quick Links</h3>
                <ul class="space-y-2 text-sm">
                    <li>
                        <a href="${pageContext.request.contextPath}/home"
                           class="text-gray-400 hover:text-white transition">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/doctors"
                           class="text-gray-400 hover:text-white transition">Our Doctors</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/departments"
                           class="text-gray-400 hover:text-white transition">Departments</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/about"
                           class="text-gray-400 hover:text-white transition">About Us</a>
                    </li>
                </ul>
            </div>

            <!-- Contact Info -->
            <div>
                <h3 class="text-white text-lg font-bold mb-4">Contact</h3>
                <ul class="space-y-2 text-sm">
                    <li class="flex items-center space-x-2">
                        <svg class="h-5 w-5 text-blue-600" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
                        </svg>
                        <span class="text-gray-400">+212 5XX-XXXXXX</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <svg class="h-5 w-5 text-blue-600" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                        </svg>
                        <span class="text-gray-400">contact@digitalclinic.ma</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <svg class="h-5 w-5 text-blue-600" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd" />
                        </svg>
                        <span class="text-gray-400">Casablanca, Morocco</span>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Copyright -->
        <div class="border-t border-gray-800 mt-8 pt-6 text-center text-sm text-gray-500">
            <p>&copy; 2025 Digital Clinic. All rights reserved.</p>
        </div>
    </div>
</footer>
