<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<sql:query var="resVehiculos" dataSource="${db}">
    SELECT v.id_vehiculo, t.nombre_tipo, v.marca, v.modelo, v.anio, v.dato_especifico, v.estado_mantenimiento
    FROM vehiculo v
    INNER JOIN tipo_vehiculo t ON v.id_tipo = t.id_tipo;
</sql:query>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Vehículos - Transportes Don Bosco</title>
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
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary fw-bold">Flota de Vehículos</h2>
            <a href="formularioVehiculo.jsp" class="btn btn-success fw-bold">Registrar Nuevo Vehículo</a>
        </div>

        <c:if test="${not empty param.msg}">
            <div class="alert alert-info shadow-sm fw-bold">${param.msg}</div>
        </c:if>

        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover m-0 align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tipo</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>Año</th>
                                <th>Capacidad/Cilindraje</th>
                                <th>Estado</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${resVehiculos.rows}">
                                <tr>
                                    <td class="fw-bold"><c:out value="${row.id_vehiculo}"/></td>
                                    <td><c:out value="${row.nombre_tipo}"/></td>
                                    <td><c:out value="${row.marca}"/></td>
                                    <td><c:out value="${row.modelo}"/></td>
                                    <td><c:out value="${row.anio}"/></td>
                                    <td><c:out value="${row.dato_especifico}"/></td>
                                    <td><span class="badge bg-secondary"><c:out value="${row.estado_mantenimiento}"/></span></td>
                                    <td class="text-center">
                                        <a href="formularioEditarVehiculo.jsp?id=${row.id_vehiculo}" class="btn btn-warning btn-sm fw-bold me-1">Editar</a>
                                        <a href="controller.jsp?accion=eliminarVehiculo&id=${row.id_vehiculo}" class="btn btn-danger btn-sm fw-bold" onclick="return confirm('¿Eliminar este vehículo?');">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>