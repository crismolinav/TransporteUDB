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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehículos - Transportes Don Bosco</title>
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
                    <li class="nav-item"><a class="nav-link active" href="listaVehiculos.jsp">Vehículos</a></li>
                    <li class="nav-item"><a class="nav-link" href="listaConductores.jsp">Conductores</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5" style="position: relative;">
        <div class="large-background-text">Equipo</div>

        <div class="d-flex justify-content-between align-items-end mb-5 pt-4">
            <div>
                <h1 class="display-serif m-0" style="font-size: 3rem;">Flota de Vehículos</h1>
                <p class="sans-clean text-muted m-0 mt-2">Control de unidades de transporte activas e indicadores mecánicos.</p>
            </div>
            <a href="formularioVehiculo.jsp" class="tdb-btn-pill">
                <span>+</span> Registrar Vehículo
            </a>
        </div>

        <c:if test="${not empty param.msg}">
            <div class="alert alert-dark border-secondary sans-clean mb-4 shadow-sm py-3" role="alert">
                ${param.msg}
            </div>
        </c:if>

        <div class="table-responsive mt-4">
            <table class="table align-middle table-hover text-dark" style="--bs-table-bg: transparent;">
                <thead style="border-bottom: 2px solid #1c1c1c;">
                    <tr class="sans-clean fw-bold text-uppercase" style="font-size: 0.85rem; letter-spacing: 0.05em;">
                        <th class="py-3">ID</th>
                        <th class="py-3">Tipo</th>
                        <th class="py-3">Marca</th>
                        <th class="py-3">Modelo</th>
                        <th class="py-3">Año</th>
                        <th class="py-3">Capacidad / Cilindraje</th>
                        <th class="py-3">Estado</th>
                        <th class="py-3 text-end">Acciones</th>
                    </tr>
                </thead>
                <tbody class="sans-clean" style="border-bottom: 1px solid rgba(28,28,28,0.1);">
                    <c:forEach var="row" items="${resVehiculos.rows}">
                        <tr style="border-bottom: 1px solid rgba(28,28,28,0.05);">
                            <td class="py-3 fw-bold"><c:out value="${row.id_vehiculo}"/></td>
                            <td class="py-3"><c:out value="${row.nombre_tipo}"/></td>
                            <td class="py-3"><c:out value="${row.marca}"/></td>
                            <td class="py-3"><c:out value="${row.modelo}"/></td>
                            <td class="py-3"><c:out value="${row.anio}"/></td>
                            <td class="py-3"><c:out value="${row.dato_especifico}"/></td>
                            <td class="py-3">
                                <span class="badge bg-dark rounded-pill px-3 py-2 text-uppercase font-monospace" style="font-size:0.7rem; background-color: #1c1c1c !important;">
                                    <c:out value="${row.estado_mantenimiento}"/>
                                </span>
                            </td>
                            <td class="py-3 text-end">
                                <a href="formularioEditarVehiculo.jsp?id=${row.id_vehiculo}" class="text-dark me-3 fw-bold text-decoration-none border-bottom border-dark pb-1" style="font-size: 0.9rem;">Editar</a>
                                <a href="controller.jsp?accion=eliminarVehiculo&id=${row.id_vehiculo}" class="text-danger fw-bold text-decoration-none border-bottom border-danger pb-1" style="font-size: 0.9rem;" onclick="return confirm('¿Remover esta unidad de la flota?');">Remover</a>
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