# Digital Hospital

This is a web application for a Digital Hospital, allowing for the management of patients, doctors, departments, and consultations.

## Features

*   User authentication (login, registration)
*   Admin dashboard for managing:
    *   Doctors
    *   Departments
    *   Rooms
    *   Consultations
*   Doctor dashboard for managing:
    *   Schedules
    *   Consultations
*   Public pages for:
    *   Viewing departments
    *   Viewing doctors
    *   Booking consultations

## Technologies Used

*   **Backend:**
    *   Java 17
    *   Jakarta EE 11 (Servlets, JSP, JSTL)
    *   Hibernate 7 (JPA provider)
    *   CDI (Weld)
    *   PostgreSQL
*   **Frontend:**
    *   JSP
    *   Tailwind CSS
*   **Build Tool:**
    *   Maven

## Getting Started

### Prerequisites

*   Java 17 or higher
*   Maven
*   PostgreSQL database
*   A servlet container like Tomcat

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/AymanElh/DigitalHospital.git
    cd DigitalHospital
    ```

2.  **Database Setup:**
    *   Create a PostgreSQL database named `clinic_db`.
    *   Update the database credentials in `src/main/resources/META-INF/persistence.xml`:
        ```xml
        <property name="jakarta.persistence.jdbc.user" value="your_username"/>
        <property name="jakarta.persistence.jdbc.password" value="your_password"/>
        ```

3.  **Build the project:**
    ```bash
    mvn clean install
    ```

4.  **Run the application:**
    *   Deploy the generated `target/DigitalHospital-1.0-SNAPSHOT.war` file to your servlet container (e.g., Tomcat).
    *   Access the application at `http://localhost:8080/DigitalHospital-1.0-SNAPSHOT/`.

## Project Structure

```
.
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com/youcode/digitalhospital
│   │   │       ├── config      # JPA configuration
│   │   │       ├── dto         # Data Transfer Objects
│   │   │       ├── mapper      # DTO to Entity mappers
│   │   │       ├── middleware  # Authentication and Authorization filters
│   │   │       ├── model       # JPA Entities
│   │   │       ├── repository  # Data Access Layer
│   │   │       ├── service     # Business Logic
│   │   │       └── servlet     # Web Controllers
│   │   ├── resources
│   │   │   └── META-INF
│   │   │       └── persistence.xml # Database configuration
│   │   └── webapp
│   │       ├── WEB-INF
│   │       │   └── web.xml     # Servlet mappings
│   │       └── view            # JSP files
│   └── test
└── pom.xml                     # Maven dependencies
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
