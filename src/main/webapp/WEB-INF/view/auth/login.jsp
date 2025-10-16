<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Digital Clinic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css" />
</head>
<body class="bg-gray-900 text-gray-100">

    <!-- Include Header/Navigation -->
    <jsp:include page="/WEB-INF/view/common/header.jsp" />

    <main class="container mx-auto px-4 py-16">
        <div class="max-w-md mx-auto">

            <!-- Login Card -->
            <div class="bg-gray-800 rounded border border-gray-700 p-8">
                <div class="text-center mb-8">
                    <h1 class="text-3xl font-bold text-white mb-2">Welcome Back</h1>
                    <p class="text-gray-400">Login to your account to continue</p>
                </div>

                <!-- Display error message if exists -->
                <c:if test="${not empty requestScope.error}">
                    <div class="bg-red-900 border border-red-600 text-red-100 px-4 py-3 rounded mb-6">
                        <c:out value="${requestScope.error}" />
                    </div>
                </c:if>

                <!-- Display success message if exists (e.g., after registration) -->
                <div><% request.getAttribute("error"); %></div>
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="bg-green-900 border border-green-600 text-green-100 px-4 py-3 rounded mb-6">
                        <c:out value="${sessionScope.successMessage}" />
                    </div>
                    <c:remove var="successMessage" scope="session"/>
                </c:if>

                <!-- Login Form -->
                <!-- TODO: Form submits to LoginServlet (e.g., /login or /auth/login) -->
                <!-- TODO: Backend should validate credentials and create session -->
                <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-6">

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
                            placeholder="Enter your email">
                        <!-- TODO: Display validation error if email is invalid - ${errors.email} -->
                        <c:if test="${not empty errors.email}">
                            <p class="text-red-400 text-sm mt-1"><c:out value="${errors.email}" /></p>
                        </c:if>
                    </div>

                    <!-- Password Field -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-300 mb-2">
                            Password
                        </label>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            required
                            class="w-full px-4 py-3 bg-gray-700 border border-gray-600 rounded text-white placeholder-gray-400 focus:outline-none focus:border-blue-600 transition"
                            placeholder="Enter your password">
                        <!-- TODO: Display validation error if password is invalid - ${errors.password} -->
                        <c:if test="${not empty errors.password}">
                            <p class="text-red-400 text-sm mt-1"><c:out value="${errors.password}" /></p>
                        </c:if>
                    </div>

                    <!-- Remember Me & Forgot Password -->
                    <div class="flex items-center justify-between">
                        <label class="flex items-center">
                            <input
                                type="checkbox"
                                name="remember"
                                class="w-4 h-4 bg-gray-700 border-gray-600 rounded text-blue-600 focus:ring-blue-600">
                            <span class="ml-2 text-sm text-gray-300">Remember me</span>
                        </label>
                        <a href="${pageContext.request.contextPath}/forgot-password"
                           class="text-sm text-blue-600 hover:text-blue-500 transition">
                            Forgot password?
                        </a>
                    </div>

                    <!-- Submit Button -->
                    <button
                        type="submit"
                        class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-3 rounded transition">
                        Login
                    </button>
                </form>

                <!-- Divider -->
                <div class="relative my-6">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-700"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-2 bg-gray-800 text-gray-400">Don't have an account?</span>
                    </div>
                </div>

                <!-- Register Link -->
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/register"
                       class="text-blue-600 hover:text-blue-500 font-semibold transition">
                        Create a new account
                    </a>
                </div>
            </div>

            <!-- Additional Info -->
            <div class="mt-6 text-center text-sm text-gray-400">
                <p>By logging in, you agree to our Terms of Service and Privacy Policy</p>
            </div>
        </div>
    </main>

    <!-- Include Footer -->
    <jsp:include page="/WEB-INF/view/common/footer.jsp" />

</body>
</html>
