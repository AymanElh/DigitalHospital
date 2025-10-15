<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Digital Hospital</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/output.css" />
</head>
<body class="min-h-screen bg-gray-50">
<div class="max-w-3xl mx-auto p-6">
    <h1 class="text-3xl font-bold text-hospital-primary">Hello World!</h1>
    <p class="mt-2 text-gray-600">If this text is blue and styled, Tailwind v4 is working.</p>

    <div class="hospital-card mt-6">
        <p class="mb-4">Card with custom utility.</p>
        <a class="btn-primary" href="hello-servlet">Hello Servlet</a>
        <a class="btn-secondary ml-2" href="home">Home</a>
    </div>
</div>
</body>
</html>