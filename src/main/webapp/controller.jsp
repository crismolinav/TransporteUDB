<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.sql" prefix="sql" %>

<sql:setDataSource var="db" dataSource="jdbc/flotadb" />

<c:set var="accion" value="${param.accion}" />

<c:choose>
    <%-- ==========================================
         LÓGICA PARA CONDUCTORES
         ========================================== --%>

    <%-- GUARDAR CONDUCTOR --%>
    <c:when test="${accion == 'insertarConductor'}">
        <c:catch var="errorConductor">
            <sql:update dataSource="${db}">
                INSERT INTO conductor (dui, nombre_completo, edad, sexo, licencia_vigente)
                VALUES (?, ?, ?, ?, ?)
                <sql:param value="${param.dui}" />
                <sql:param value="${param.nombre}" />
                <sql:param value="${param.edad}" />
                <sql:param value="${param.sexo}" />
                <sql:param value="${param.licencia}" />
            </sql:update>
        </c:catch>
        <c:choose>
            <c:when test="${not empty errorConductor}">
                <c:redirect url="listaConductores.jsp?msg=Error:+El+DUI+ya+existe+o+hay+datos+invalidos" />
            </c:when>
            <c:otherwise>
                <c:redirect url="listaConductores.jsp?msg=Conductor+Agregado+Exitosamente" />
            </c:otherwise>
        </c:choose>
    </c:when>

    <%-- ACTUALIZAR CONDUCTOR --%>
    <c:when test="${accion == 'editarConductor'}">
         <sql:update dataSource="${db}">
            UPDATE conductor SET nombre_completo = ?, edad = ?, sexo = ?, licencia_vigente = ? WHERE dui = ?
            <sql:param value="${param.nombre}" />
            <sql:param value="${param.edad}" />
            <sql:param value="${param.sexo}" />
            <sql:param value="${param.licencia}" />
            <sql:param value="${param.dui}" />
         </sql:update>
         <c:redirect url="listaConductores.jsp?msg=Conductor+Actualizado+Correctamente" />
    </c:when>

    <%-- ELIMINAR CONDUCTOR --%>
    <c:when test="${accion == 'eliminarConductor'}">
         <sql:update dataSource="${db}">
            DELETE FROM conductor WHERE dui = ?
            <sql:param value="${param.dui}" />
         </sql:update>
         <c:redirect url="listaConductores.jsp?msg=Conductor+Eliminado+Correctamente" />
    </c:when>

    <%-- ==========================================
         LÓGICA PARA VEHÍCULOS
         ========================================== --%>

    <%-- GUARDAR VEHÍCULO --%>
    <c:when test="${accion == 'insertarVehiculo'}">
        <c:catch var="errorVehiculo">
            <sql:update dataSource="${db}">
                INSERT INTO vehiculo (id_tipo, marca, modelo, anio, dato_especifico, estado_mantenimiento)
                VALUES (?, ?, ?, ?, ?, ?)
                <sql:param value="${param.id_tipo}" />
                <sql:param value="${param.marca}" />
                <sql:param value="${param.modelo}" />
                <sql:param value="${param.anio}" />
                <sql:param value="${param.dato_especifico}" />
                <sql:param value="${param.estado_mantenimiento}" />
            </sql:update>
        </c:catch>
        <c:choose>
            <c:when test="${not empty errorVehiculo}">
                <c:redirect url="listaVehiculos.jsp?msg=Error+al+registrar+el+vehiculo" />
            </c:when>
            <c:otherwise>
                <c:redirect url="listaVehiculos.jsp?msg=Vehiculo+Agregado+Exitosamente" />
            </c:otherwise>
        </c:choose>
    </c:when>

    <%-- ACTUALIZAR VEHÍCULO --%>
    <c:when test="${accion == 'editarVehiculo'}">
        <c:catch var="errorUpdateVehiculo">
            <sql:update dataSource="${db}">
                UPDATE vehiculo SET id_tipo = ?, marca = ?, modelo = ?, anio = ?, dato_especifico = ?, estado_mantenimiento = ?
                WHERE id_vehiculo = ?
                <sql:param value="${param.id_tipo}" />
                <sql:param value="${param.marca}" />
                <sql:param value="${param.modelo}" />
                <sql:param value="${param.anio}" />
                <sql:param value="${param.dato_especifico}" />
                <sql:param value="${param.estado_mantenimiento}" />
                <sql:param value="${param.id_vehiculo}" />
            </sql:update>
        </c:catch>
        <c:choose>
            <c:when test="${not empty errorUpdateVehiculo}">
                <c:redirect url="listaVehiculos.jsp?msg=Error+al+actualizar+el+vehiculo" />
            </c:when>
            <c:otherwise>
                <c:redirect url="listaVehiculos.jsp?msg=Vehiculo+Actualizado+Correctamente" />
            </c:otherwise>
        </c:choose>
    </c:when>

    <%-- ELIMINAR VEHÍCULO --%>
    <c:when test="${accion == 'eliminarVehiculo'}">
         <sql:update dataSource="${db}">
            DELETE FROM vehiculo WHERE id_vehiculo = ?
            <sql:param value="${param.id}" />
         </sql:update>
         <c:redirect url="listaVehiculos.jsp?msg=Vehiculo+Eliminado+Correctamente" />
    </c:when>

    <c:otherwise>
        <c:redirect url="index.jsp" />
    </c:otherwise>
</c:choose>