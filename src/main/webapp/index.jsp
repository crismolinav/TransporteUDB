<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<%-- Conectando al Pool de Conexiones --%>
<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transportes Don Bosco - Menú Principal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">Transportes Don Bosco</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listaVehiculos.jsp">Gestión de Vehículos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listaConductores.jsp">Gestión de Conductores</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="p-5 mb-4 bg-white rounded-3 shadow-sm border text-center">
            <h1 class="display-5 fw-bold text-primary">Sistema de Modernización de Flota</h1>
            <p class="col-md-8 fs-4 mx-auto text-muted">
                Bienvenido al panel administrativo de Transportes Don Bosco. Desde aquí puedes gestionar vehículos, conductores y sus asignaciones de manera web.
            </p>
            <hr class="my-4">
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                <a href="listaVehiculos.jsp" class="btn btn-primary btn-lg px-4 gap-3">Ver Vehículos</a>
                <a href="listaConductores.jsp" class="btn btn-outline-secondary btn-lg px-4">Ver Conductores</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>