<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Conductor - Transportes Don Bosco</title>
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
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Registrar Nuevo Conductor</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="controller.jsp" method="POST">
                            <input type="hidden" name="accion" value="insertarConductor">

                            <div class="mb-3">
                                <label class="form-label fw-bold">DUI (Ej: 12345678-9)</label>
                                <input type="text" class="form-control" name="dui" required maxlength="10">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Nombre Completo</label>
                                <input type="text" class="form-control" name="nombre" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Edad</label>
                                <input type="number" class="form-control" name="edad" required min="18">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Sexo</label>
                                <select class="form-select" name="sexo" required>
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fw-bold">Estado de Licencia</label>
                                <select class="form-select" name="licencia" required>
                                    <option value="1">Vigente</option>
                                    <option value="0">Vencida</option>
                                </select>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success btn-lg">Guardar Conductor</button>
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