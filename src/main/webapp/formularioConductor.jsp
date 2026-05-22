<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta Conductor - Transportes Don Bosco</title>
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
                <h2 class="display-serif mb-2" style="font-size: 2.5rem;">Ficha de Registro</h2>
                <p class="sans-clean text-muted mb-5">Ingrese las credenciales oficiales del nuevo conductor.</p>

                <form action="controller.jsp" method="POST" class="sans-clean">
                    <input type="hidden" name="accion" value="insertarConductor">

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Documento Único de Identidad (DUI)</label>
                        <input type="text" class="form-control tdb-line-input" name="dui" required maxlength="10"
                               pattern="[0-9]{8}-[0-9]" title="Formato requerido: 12345678-9" placeholder="00000000-0">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Nombre Completo</label>
                        <input type="text" class="form-control tdb-line-input" name="nombre" required placeholder="Ej. Christopher Villacorta">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Edad Cronológica</label>
                        <input type="number" class="form-control tdb-line-input" name="edad" required min="18" placeholder="Años mínimos: 18">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Género asignado</label>
                        <select class="form-select tdb-line-input" name="sexo" required>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>

                    <div class="mb-5">
                        <label class="form-label fw-bold text-uppercase tracking-wider" style="font-size:0.75rem;">Estado Legal de Licencia</label>
                        <select class="form-select tdb-line-input" name="licencia" required>
                            <option value="1">Vigente / Activa</option>
                            <option value="0">Vencida / Inactiva</option>
                        </select>
                    </div>

                    <div class="d-flex align-items-center justify-content-between pt-2">
                        <a href="listaConductores.jsp" class="text-dark fw-bold text-decoration-none border-bottom border-dark pb-1">Volver al listado</a>
                        <button type="submit" class="tdb-btn-pill">Guardar Registro</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>