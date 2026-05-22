<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<sql:query var="resConductor" dataSource="${db}">
    SELECT dui, nombre_completo, edad, sexo, licencia_vigente FROM conductor WHERE dui = ?
    <sql:param value="${param.dui}" />
</sql:query>

<c:set var="conductor" value="${resConductor.rows[0]}" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Conductor - Transportes Don Bosco</title>
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
                <h2 class="display-serif mb-2" style="font-size: 2.5rem;">Modificar Registro</h2>
                <p class="sans-clean text-muted mb-5">Actualice los datos asociados al DUI <span class="fw-bold text-dark">${conductor.dui}</span>.</p>

                <form action="controller.jsp" method="POST" class="sans-clean">
                    <input type="hidden" name="accion" value="editarConductor">
                    <input type="hidden" name="dui" value="${conductor.dui}">

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider style-label" style="font-size:0.75rem; color: rgba(0,0,0,0.4);">DUI (No modificable)</label>
                        <input type="text" class="form-control tdb-line-input text-muted" value="${conductor.dui}" disabled style="border-bottom-style: dashed;">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Nombre Completo</label>
                        <input type="text" class="form-control tdb-line-input" name="nombre" value="${conductor.nombre_completo}" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Edad</label>
                        <input type="number" class="form-control tdb-line-input" name="edad" value="${conductor.edad}" required min="18">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Sexo</label>
                        <select class="form-select tdb-line-input" name="sexo" required>
                            <option value="M" <c:if test="${conductor.sexo == 'M'}">selected</c:if>>Masculino</option>
                            <option value="F" <c:if test="${conductor.sexo == 'F'}">selected</c:if>>Femenino</option>
                        </select>
                    </div>

                    <div class="mb-5">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Vigencia de Licencia</label>
                        <select class="form-select tdb-line-input" name="licencia" required>
                            <option value="1" <c:if test="${conductor.licencia_vigente}">selected</c:if>>Vigente</option>
                            <option value="0" <c:if test="${not conductor.licencia_vigente}">selected</c:if>>Vencida</option>
                        </select>
                    </div>

                    <div class="d-flex align-items-center justify-content-between pt-2">
                        <a href="listaConductores.jsp" class="text-dark fw-bold text-decoration-none border-bottom border-dark pb-1">Cancelar</a>
                        <button type="submit" class="tdb-btn-pill">Actualizar Datos</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>