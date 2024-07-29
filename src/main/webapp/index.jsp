<%@ page import="cl.praxis.desafio2.business.BusinessRoom" %>
<%@ page import="java.util.List" %>
<%@ page import="cl.praxis.desafio2.model.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Reservas de habitaciones</title>
  <%@ include file="/assets/html/head.jsp" %>
</head>
<body>
  <%@ include file="assets/html/header.jsp" %>
  <%
    BusinessRoom businessRoom = new BusinessRoom();
    List<Room> rooms = businessRoom.getRoomList();
    int numberRooms = rooms.size();
    request.setAttribute("rooms", rooms);
    request.setAttribute("numberRooms", numberRooms);
  %>
  <form method="post" action="procesa.jsp">
    <section class="container">
      <h3 class="mt-60">Habitaciones disponibles (${numberRooms})</h3>

      <hr class="my-4">

      <div class="row mt-4">
        <%
          for (Room room : rooms) {
        %>
        <div class="col-md-4">
          <div class="card mb-4" style="height: 95%">
            <img class="card-img-top" style="height: 240px" src="<%= room.getImage() %>" alt="Imagen de la tarjeta (habitacion)">
            <div class="card-body text-center">
              <h5 class="card-title">Habitación (<%= room.getId() %>)</h5>
              <h5 class="card-title"><%= room.getName() %></h5>
              <p class="card-text"><%= room.getDescription() %></p>
              <p class="card-text"><strong>Precio: $<%= room.getPrice() %></strong></p>
              <div class="form-check d-flex justify-content-center">
                <input class="form-check-input position-static" type="radio" name="id" value="<%= room.getId() %>">
              </div>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>

      <h3 class="mt-120">Informacion de reserva de habitacion</h3>

      <hr class="my-4">

      <div class="row mt-4">
        <div class="form-group col-md-6">
          <label for="nombre">Nombre:</label>
          <input type="text" class="form-control" id="nombre" name="nombre">
        </div>
        <div class="form-group col-md-6">
          <label for="apellido">Apellidos:</label>
          <input type="text" class="form-control" id="apellido" name="apellido">
        </div>
      </div>
      <div class="row mt-4">
        <div class="form-group col-md-6">
          <label for="email">Correo electrónico:</label>
          <input type="email" class="form-control" id="email" name="email">
        </div>
        <div class="form-group col-md-2">
            <label for="medio_pago">Medio de Pago:</label>
            <select class="form-control" id="medio_pago" name="medio_pago">
              <option value="Contado">Contado</option>
              <option value="Tarjeta">Tarjeta</option>
            </select>
        </div>
        <div class="form-group col-md-2">
          <label for="dias">Días:</label>
          <select class="form-control" id="dias" name="dias">
              <option value="1">1 día</option>
              <option value="2">2 días</option>
              <option value="3">3 días</option>
            </select>
        </div>
        <div class="form-group col-md-2">
          <label for="fecha_entrada">Fecha de entrada:</label>
          <input type="date" class="form-control" id="fecha_entrada" name="fecha_entrada">
        </div>
      </div>

      <hr class="my-4">

      <div class="form-row mt-4">
          <div class="form-group col-md-12 text-right">
            <button type="submit" class="btn btn-primary">Enviar solicitud de compra</button>
          </div>
      </div>
    </section>
  </form>
  <div class="mt-60">
    <%@ include file="assets/html/footer.jsp" %>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>