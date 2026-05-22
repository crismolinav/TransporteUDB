<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<sql:query var="resConductores" dataSource="${db}">
    SELECT dui, nombre_completo, edad, sexo, licencia_vigente FROM conductor;
</sql:query>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Conductores - Transportes Don Bosco</title>
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
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary fw-bold">Directorio de Conductores</h2>
            <a href="formularioConductor.jsp" class="btn btn-success fw-bold">Registrar Nuevo Conductor</a>
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
                                <th>DUI</th>
                                <th>Nombre Completo</th>
                                <th>Edad</th>
                                <th>Sexo</th>
                                <th>Licencia</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${resConductores.rows}">
                                <tr>
                                    <td class="fw-bold"><c:out value="${row.dui}"/></td>
                                    <td><c:out value="${row.nombre_completo}"/></td>
                                    <td><c:out value="${row.edad}"/> años</td>
                                    <td><c:out value="${row.sexo}"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${row.licencia_vigente}">
                                                <span class="badge bg-success">Vigente</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Vencida</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <a href="formularioEditarConductor.jsp?dui=${row.dui}" class="btn btn-warning btn-sm fw-bold me-1">Editar</a>
                                        <a href="controller.jsp?accion=eliminarConductor&dui=${row.dui}" class="btn btn-danger btn-sm fw-bold" onclick="return confirm('¿Seguro que deseas eliminar a este conductor?');">Eliminar</a>
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