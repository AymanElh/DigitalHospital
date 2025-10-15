<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css" />
</head>
<body class="bg-gray-900 text-gray-100">

    <!-- Include Header/Navigation -->
    <jsp:include page="/WEB-INF/view/common/header.jsp" />

    <main class="container mx-auto px-4 py-16">
        <div class="max-w-2xl mx-auto">

            <!-- Register Card -->
            <div class="bg-gray-800 rounded border border-gray-700 p-8">
                <div class="text-center mb-8">
                    <h1 class="text-3xl font-bold text-white mb-2">Create Your Account</h1>
                    <p class="text-gray-400">Join Digital Clinic to manage your health easily</p>
                </div>

                <!-- Display error message if exists -->
                <c:if test="${not empty requestScope.error}">
                    <div class="bg-red-900 border border-red-600 text-red-100 px-4 py-3 rounded mb-6">
                        <c:out value="${requestScope.error}" />
                    </div>
                </c:if>

                <!-- Registration Form -->
                <!-- TODO: Form submits to RegisterServlet (e.g., /register or /auth/register) -->
                <!-- TODO: Backend should validate data, create Patient entity, and redirect to login -->
                <form action="${pageContext.request.contextPath}/register" method="POST" class="space-y-6">

                    <!-- Name Fields Row -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- First Name -->
                        <div>
                            <label for="firstName" class="block text-sm font-medium text-gray-300 mb-2">
                                First Name
                            </label>
                            <input
                                type="text"
                                id="firstName"
                                name="firstName"
                                required
                                value="${param.firstName}"
                                class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                                placeholder="John">
                            <!-- TODO: Display validation error - ${errors.firstName} -->
                            <c:if test="${not empty errors.firstName}">
                                <p class="text-red-400 text-sm mt-1"><c:out value="${errors.firstName}" /></p>
                            </c:if>
                        </div>

                        <!-- Last Name -->
                        <div>
                            <label for="lastName" class="block text-sm font-medium text-gray-300 mb-2">
                                Last Name
                            </label>
                            <input
                                type="text"
                                id="lastName"
                                name="lastName"
                                required
                                value="${param.lastName}"
                                class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                                placeholder="Doe">
                            <!-- TODO: Display validation error - ${errors.lastName} -->
                            <c:if test="${not empty errors.lastName}">
                                <p class="text-red-400 text-sm mt-1"><c:out value="${errors.lastName}" /></p>
                            </c:if>
                        </div>
                    </div>

                    <!-- Email Field -->
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-300 mb-2">
                            Email Address
                        </label>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            required
                            value="${param.email}"
                            class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                            placeholder="john.doe@example.com">
                        <!-- TODO: Display validation error - ${errors.email} -->
                        <c:if test="${not empty errors.email}">
                            <p class="text-red-400 text-sm mt-1"><c:out value="${errors.email}" /></p>
                        </c:if>
                    </div>

                    <!-- Phone Field -->
                    <div>
                        <label for="phone" class="block text-sm font-medium text-gray-300 mb-2">
                            Phone Number
                        </label>
                        <input
                            type="tel"
                            id="phone"
                            name="phone"
                            required
                            value="${param.phone}"
                            class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                            placeholder="+212 6XX-XXXXXX">
                        <!-- TODO: Display validation error - ${errors.phone} -->
                        <c:if test="${not empty errors.phone}">
                            <p class="text-red-400 text-sm mt-1"><c:out value="${errors.phone}" /></p>
                        </c:if>
                    </div>

                    <!-- Date of Birth Field -->
                    <div>
                        <label for="dateOfBirth" class="block text-sm font-medium text-gray-300 mb-2">
                            Date of Birth
                        </label>
                        <input
                            type="date"
                            id="dateOfBirth"
                            name="dateOfBirth"
                            required
                            value="${param.dateOfBirth}"
                            class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition">
                        <!-- TODO: Display validation error - ${errors.dateOfBirth} -->
                        <c:if test="${not empty errors.dateOfBirth}">
                            <p class="text-red-400 text-sm mt-1"><c:out value="${errors.dateOfBirth}" /></p>
                        </c:if>
                    </div>

                    <!-- Password Fields Row -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Password -->
                        <div>
                            <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
                                Password
                            </label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                required
                                minlength="6"
                                class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                                placeholder="Min. 6 characters">
                            <!-- TODO: Display validation error - ${errors.password} -->
                            <c:if test="${not empty errors.password}">
                                <p class="text-red-400 text-sm mt-1"><c:out value="${errors.password}" /></p>
                            </c:if>
                        </div>

                        <!-- Confirm Password -->
                        <div>
                            <label for="confirmPassword" class="block text-sm font-medium text-gray-300 mb-2">
                                Confirm Password
                            </label>
                            <input
                                type="password"
                                id="confirmPassword"
                                name="confirmPassword"
                                required
                                minlength="6"
                                class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                                placeholder="Repeat password">
                            <!-- TODO: Display validation error - ${errors.confirmPassword} -->
                            <c:if test="${not empty errors.confirmPassword}">
                                <p class="text-red-400 text-sm mt-1"><c:out value="${errors.confirmPassword}" /></p>
                            </c:if>
                        </div>
                    </div>

                    <!-- Terms and Conditions -->
                    <div>
                        <label class="flex items-start">
                            <input
                                type="checkbox"
                                name="terms"
                                required
                                class="w-4 h-4 mt-1 bg-gray-700 border-gray-600 rounded text-blue-600 focus:ring-blue-600">
                            <span class="ml-2 text-sm text-gray-300">
                                I agree to the
                                <a href="#" class="text-blue-600 hover:text-blue-500">Terms of Service</a>
                                and
                                <a href="#" class="text-blue-600 hover:text-blue-500">Privacy Policy</a>
                            </span>
                        </label>
                    </div>

                    <!-- Submit Button -->
                    <button
                        type="submit"
                        class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-3 rounded transition">
                        Create Account
                    </button>
                </form>

                <!-- Divider -->
                <div class="relative my-6">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-700"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-2 bg-gray-800 text-gray-400">Already have an account?</span>
                    </div>
                </div>

                <!-- Login Link -->
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-blue-600 hover:text-blue-500 font-semibold transition">
                        Login to your account
                    </a>
                </div>
            </div>

            <!-- Additional Info -->
            <div class="mt-6 text-center text-sm text-gray-400">
                <p>By creating an account, you will be registered as a Patient</p>
            </div>
        </div>
    </main>

    <!-- Include Footer -->
    <jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>
