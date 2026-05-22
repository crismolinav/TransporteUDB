<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<%-- 1. Obtener los datos del vehículo a editar basado en el ID recibido por URL --%>
<sql:query var="resVehiculo" dataSource="${db}">
    SELECT id_vehiculo, id_tipo, marca, modelo, anio, dato_especifico, estado_mantenimiento
    FROM vehiculo WHERE id_vehiculo = ?
    <sql:param value="${param.id}" />
</sql:query>

<c:set var="vehiculo" value="${resVehiculo.rows[0]}" />

<%-- 2. Obtener las opciones de tipos de vehículos para llenar el select --%>
<sql:query var="resTipos" dataSource="${db}">
    SELECT id_tipo, nombre_tipo FROM tipo_vehiculo;
</sql:query>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Vehículo - Transportes Don Bosco</title>
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
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link active" href="listaVehiculos.jsp">Gestión de Vehículos</a></li>
                    <li class="nav-item"><a class="nav-link" href="listaConductores.jsp">Gestión de Conductores</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0 fw-bold">Editar Datos del Vehículo</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="controller.jsp" method="POST">
                            <input type="hidden" name="accion" value="editarVehiculo">
                            <input type="hidden" name="id_vehiculo" value="${vehiculo.id_vehiculo}">

                            <div class="mb-3">
                                <label class="form-label fw-bold">ID Vehículo</label>
                                <input type="text" class="form-control" value="${vehiculo.id_vehiculo}" disabled>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Tipo de Vehículo</label>
                                <select class="form-select" name="id_tipo" required>
                                    <c:forEach var="tipo" items="${resTipos.rows}">
                                        <option value="${tipo.id_tipo}" <c:if test="${tipo.id_tipo == vehiculo.id_tipo}">selected</c:if>>
                                            ${tipo.nombre_tipo}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Marca</label>
                                <input type="text" class="form-control" name="marca" value="${vehiculo.marca}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Modelo</label>
                                <input type="text" class="form-control" name="modelo" value="${vehiculo.modelo}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Año</label>
                                <input type="number" class="form-control" name="anio" value="${vehiculo.anio}" required min="1990" max="2027">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Capacidad / Cilindraje</label>
                                <input type="number" step="0.01" class="form-control" name="dato_especifico" value="${vehiculo.dato_especifico}" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fw-bold">Estado de Mantenimiento</label>
                                <input type="text" class="form-control" name="estado_mantenimiento" value="${vehiculo.estado_mantenimiento}" required>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-warning btn-lg fw-bold">Actualizar Vehículo</button>
                                <a href="listaVehiculos.jsp" class="btn btn-outline-secondary">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>