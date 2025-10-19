/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./**/*.jsp",
        "./**/*.html",
        "./**/*.js",
        "./WEB-INF/**/*.jsp" // Include JSP files in WEB-INF
    ],
    theme: {
        extend: {
            colors: {
                hospital: {
                    primary: '#2563eb',
                    secondary: '#1e40af',
                    accent: '#f59e0b',
                    success: '#10b981',
                    danger: '#ef4444'
                }
            },
            fontFamily: {
                sans: ['Inter', 'system-ui', 'sans-serif'],
            }
        },
    },
    plugins: [],
}