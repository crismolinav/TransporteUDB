<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<%-- Obtener los datos del conductor a editar basado en el DUI que viene en la URL --%>
<sql:query var="resConductor" dataSource="${db}">
    SELECT dui, nombre_completo, edad, sexo, licencia_vigente FROM conductor WHERE dui = ?
    <sql:param value="${param.dui}" />
</sql:query>

<%-- Guardamos la fila en una variable para acceder más fácil a los datos --%>
<c:set var="conductor" value="${resConductor.rows[0]}" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Conductor - Transportes Don Bosco</title>
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
                    <li class="nav-item"><a class="nav-link" href="listaVehiculos.jsp">Gestión de Vehículos</a></li>
                    <li class="nav-item"><a class="nav-link active" href="listaConductores.jsp">Gestión de Conductores</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0 fw-bold">Editar Datos del Conductor</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="controller.jsp" method="POST">
                            <input type="hidden" name="accion" value="editarConductor">

                            <input type="hidden" name="dui" value="${conductor.dui}">

                            <div class="mb-3">
                                <label class="form-label fw-bold">DUI</label>
                                <input type="text" class="form-control" value="${conductor.dui}" disabled>
                                <small class="text-muted">Por seguridad, el número de DUI no se puede modificar.</small>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Nombre Completo</label>
                                <input type="text" class="form-control" name="nombre" value="${conductor.nombre_completo}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Edad</label>
                                <input type="number" class="form-control" name="edad" value="${conductor.edad}" required min="18">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Sexo</label>
                                <select class="form-select" name="sexo" required>
                                    <option value="M" <c:if test="${conductor.sexo == 'M'}">selected</c:if>>Masculino</option>
                                    <option value="F" <c:if test="${conductor.sexo == 'F'}">selected</c:if>>Femenino</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fw-bold">Estado de Licencia</label>
                                <select class="form-select" name="licencia" required>
                                    <%-- Recordando que licencia_vigente ahora lo tratamos como booleano por Tomcat 10 --%>
                                    <option value="1" <c:if test="${conductor.licencia_vigente}">selected</c:if>>Vigente</option>
                                    <option value="0" <c:if test="${not conductor.licencia_vigente}">selected</c:if>>Vencida</option>
                                </select>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-warning btn-lg fw-bold">Actualizar Conductor</button>
                                <a href="listaConductores.jsp" class="btn btn-outline-secondary">Cancelar</a>
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