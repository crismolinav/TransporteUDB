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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conductores - Transportes Don Bosco</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css?v=1" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-expand-lg shadow-none py-3">
        <div class="container">
            <a class="navbar-brand fw-bold fs-4 display-serif" href="index.jsp">Transportes Don Bosco</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto sans-clean fw-semibold">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="listaVehiculos.jsp">Vehículos</a></li>
                    <li class="nav-item"><a class="nav-link active" href="listaConductores.jsp">Conductores</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5" style="position: relative;">
        <div class="large-background-text">Personal</div>

        <div class="d-flex justify-content-between align-items-end mb-5 pt-4">
            <div>
                <h1 class="display-serif m-0" style="font-size: 3rem;">Directorio de Conductores</h1>
                <p class="sans-clean text-muted m-0 mt-2">Personal administrativo asignado a la flota de transporte.</p>
            </div>
            <a href="formularioConductor.jsp" class="tdb-btn-pill">
                <span>+</span> Registrar Conductor
            </a>
        </div>

        <c:if test="${not empty param.msg}">
            <div class="alert alert-dark border-secondary sans-clean mb-4 shadow-sm py-3" role="alert">
                ${param.msg}
            </div>
        </c:if>

        <div class="table-responsive mt-4">
            <table class="table align-middle table-hover text-dark custom-table" style="--bs-table-bg: transparent;">
                <thead style="border-bottom: 2px solid #1c1c1c;">
                    <tr class="sans-clean fw-bold text-uppercase" style="font-size: 0.85rem; letter-spacing: 0.05em;">
                        <th class="py-3">DUI</th>
                        <th class="py-3">Nombre Completo</th>
                        <th class="py-3">Edad</th>
                        <th class="py-3">Sexo</th>
                        <th class="py-3">Licencia</th>
                        <th class="py-3 text-end">Acciones</th>
                    </tr>
                </thead>
                <tbody class="sans-clean" style="border-bottom: 1px solid rgba(28,28,28,0.1);">
                    <c:forEach var="row" items="${resConductores.rows}">
                        <tr style="border-bottom: 1px solid rgba(28,28,28,0.05);">
                            <td class="py-3 fw-bold"><c:out value="${row.dui}"/></td>
                            <td class="py-3"><c:out value="${row.nombre_completo}"/></td>
                            <td class="py-3"><c:out value="${row.edad}"/> años</td>
                            <td class="py-3"><c:out value="${row.sexo}"/></td>
                            <td class="py-3">
                                <c:choose>
                                    <c:when test="${row.licencia_vigente}">
                                        <span class="badge bg-dark rounded-pill px-3 py-2 text-uppercase font-monospace" style="font-size:0.7rem; background-color: #1c1c1c !important;">Vigente</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-transparent border border-danger text-danger rounded-pill px-3 py-2 text-uppercase font-monospace" style="font-size:0.7rem;">Vencida</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="py-3 text-end">
                                <a href="formularioEditarConductor.jsp?dui=${row.dui}" class="text-dark me-3 fw-bold text-decoration-none border-bottom border-dark pb-1" style="font-size: 0.9rem;">Editar</a>
                                <a href="controller.jsp?accion=eliminarConductor&dui=${row.dui}" class="text-danger fw-bold text-decoration-none border-bottom border-danger pb-1" style="font-size: 0.9rem;" onclick="return confirm('¿Seguro de remover este conductor?');">Remover</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>