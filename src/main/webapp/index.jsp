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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/estilos.css?v=1" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5" style="position: relative;">

    <div class="large-background-text">Flota</div>

    <div class="row pt-5 align-items-center">

        <div class="col-lg-7 px-lg-5 mb-5 mb-lg-0">
            <div class="mb-4">
                <span class="tdb-btn-pill">
                    <span style="height:8px; width:8px; background-color:white; border-radius:50%; display:inline-block;"></span>
                    Panel de Administración
                </span>
            </div>

            <h1 class="display-serif text-primary" style="font-size: 3.5rem; line-height: 1.1;">
                Sistema de Modernización <br> de Flota
            </h1>

            <p class="sans-clean fs-5 mt-4 text-muted col-md-10" style="font-weight: 400; line-height: 1.6;">
                Bienvenido a la plataforma web de Transportes Don Bosco. <br> Gestión integral de vehículos, conductores y asignaciones con un diseño diseñado para la eficiencia.
            </p>
        </div>

        <div class="col-lg-5 p-5 bg-white rounded-5 shadow-lg border" style="background-color: white !important;">
            <div class="text-center p-3">
                <h4 class="display-serif mb-4 text-dark" style="font-size: 2rem;">Acciones Rápidas</h4>

                <div class="d-grid gap-3 mb-4 mt-5 px-4">
                    <a href="listaVehiculos.jsp" class="tdb-btn-pill btn-lg justify-content-center fw-bold" style="font-size:1.1rem; padding: 18px 28px;">
                        Ver Vehículos
                    </a>
                </div>

                <div class="mt-4">
                    <a href="listaConductores.jsp" class="text-dark sans-clean fw-bold fs-6 text-decoration-none border-bottom border-dark pb-1">
                        Ver Conductores
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>