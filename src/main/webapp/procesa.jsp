<%@ page import="cl.praxis.desafio2.business.BusinessRoom" %>
<%@ page import="cl.praxis.desafio2.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Procesar Solicitud</title>
    <link rel="stylesheet" type="text/css" href="assets/css/styles.css">
    <%@ include file="assets/html/head.jsp" %>
</head>
<body>
    <%@ include file="assets/html/header.jsp" %>
    <%
        String roomId = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String medioPago = request.getParameter("medio_pago");
        String dias = request.getParameter("dias");
        String fechaEntrada = request.getParameter("fecha_entrada");

        if (roomId == null || roomId.isEmpty()) {
            throw new RuntimeException("No se ha seleccionado ninguna habitación.");
        }

        int idHabitacion = Integer.parseInt(roomId);

        BusinessRoom habitacionBusiness = new BusinessRoom();
        Room habitacionSeleccionada = habitacionBusiness.getRoomByID(idHabitacion);

        if (habitacionSeleccionada == null) {
            throw new RuntimeException("No se encontró la habitación con ID: " + idHabitacion);
        }

        int totalPagar = habitacionSeleccionada.getPrice() * Integer.parseInt(dias);
    %>
    <div class="container">
        <h3 class="mt-60">Confirmación de reserva: Habitacion <%= habitacionSeleccionada.getId() %>, <%= habitacionSeleccionada.getName() %> </h3>

        <hr>

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Item</th>
                <th scope="col">Valor</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><strong>1</strong></td>
                <td>Nombre:</td>
                <td><%= nombre %></td>
            </tr>
            <tr>
                <td><strong>2</strong></td>
                <td>Apellido:</td>
                <td><%= apellido %></td>
            </tr>
            <tr>
                <td><strong>3</strong></td>
                <td>Email:</td>
                <td><%= email %></td>
            </tr>
            <tr>
                <td><strong>4</strong></td>
                <td>Medio de Pago:</td>
                <td><%= medioPago %></td>
            </tr>
            <tr>
                <td><strong>5</strong></td>
                <td>Días:</td>
                <td><%= dias %></td>
            </tr>
            <tr>
                <td><strong>6</strong></td>
                <td>Fecha de entrada:</td>
                <td><%= fechaEntrada %></td>
            </tr>
            <tr>
                <td><strong>7</strong></td>
                <td>Valor a pagar:</td>
                <td><p><strong>CL$ <%= totalPagar %></strong></p></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="mt-120">
        <%@ include file="assets/html/footer.jsp" %>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>