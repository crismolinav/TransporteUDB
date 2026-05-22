<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<sql:query var="resTipos" dataSource="${db}">
    SELECT id_tipo, nombre_tipo FROM tipo_vehiculo;
</sql:query>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta Vehículo - Transportes Don Bosco</title>
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
        </div>
    </nav>

    <div class="container my-5">
        <div class="row justify-content-center pt-4">
            <div class="col-md-6 col-lg-5">
                <h2 class="display-serif mb-2" style="font-size: 2.5rem;">Alta de Unidad</h2>
                <p class="sans-clean text-muted mb-5">Ingrese los detalles estructurales y de ingeniería del vehículo.</p>

                <form action="controller.jsp" method="POST" class="sans-clean">
                    <input type="hidden" name="accion" value="insertarVehiculo">

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Segmento de Vehículo</label>
                        <select class="form-select tdb-line-input" name="id_tipo" required>
                            <c:forEach var="tipo" items="${resTipos.rows}">
                                <option value="${tipo.id_tipo}">${tipo.nombre_tipo}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Marca / Fabricante</label>
                        <input type="text" class="form-control tdb-line-input" name="marca" required placeholder="Ej. Isuzu">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Modelo de Producción</label>
                        <input type="text" class="form-control tdb-line-input" name="modelo" required placeholder="Ej. NPR">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Año de Fabricación</label>
                        <input type="number" class="form-control tdb-line-input" name="anio" required min="1990" max="2027" placeholder="2024">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Métrica Específica (Capacidad T / Cilindraje cc)</label>
                        <input type="number" step="0.01" class="form-control tdb-line-input" name="dato_specifico" required placeholder="Ej. 5.2">
                    </div>

                    <div class="mb-5">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Estado Operativo de Mantenimiento</label>
                        <select class="form-select tdb-line-input" name="estado_mantenimiento" required>
                            <option value="Al día">Al día</option>
                            <option value="En taller">En taller</option>
                            <option value="Requiere revisión">Requiere revisión</option>
                            <option value="Fuera de servicio">Fuera de servicio</option>
                        </select>
                    </div>

                    <div class="d-flex align-items-center justify-content-between pt-2">
                        <a href="listaVehiculos.jsp" class="text-dark fw-bold text-decoration-none border-bottom border-dark pb-1">Volver a flota</a>
                        <button type="submit" class="tdb-btn-pill">Registrar Unidad</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>