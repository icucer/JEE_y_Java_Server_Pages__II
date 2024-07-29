package cl.praxis.desafio2.business;

import cl.praxis.desafio2.model.Room;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

public class BusinessRoom {
    private static List<Room> roomList;

    public BusinessRoom() {
        roomList = new ArrayList<>();

        roomList.add(new Room(1,"Habitación Simple", "Habitacion clasica con cama extragrande, balcon con vista al mar.", "assets/img/image_1.jpg", 50000, 1, 20));
        roomList.add(new Room(2,"Habitación Simple", "Habitacion clasica con cama extragrande, balcon con vista al mar.", "assets/img/image_2.jpg", 50000, 1, 20));
        roomList.add(new Room(3, "Habitación Doble", "Habitacion clasica con 2 camas extragrande, balcon con vista al mar.", "assets/img/image_3.jpg", 75000, 2, 30));
        roomList.add(new Room(4, "Habitación Doble", "Habitacion clasica con 2 camas extragrande, balcon con vista al mar.", "assets/img/image_4.jpg", 75000, 2, 30));
        roomList.add(new Room(5, "Suite", "Habitacion de lujo, en planta superior, con cama extragrande, balcon con vista al mar.", "assets/img/image_5.jpg", 120000, 3, 50));
        roomList.add(new Room(6, "Suite", "Habitacion de lujo, en planta superior, con cama extragrande, balcon con vista al mar.", "assets/img/image_6.jpg", 120000, 3, 50));
    }

    public List<Room> getRoomList() {
        return roomList;
    }

    public static Room getRoomByID(int id) {
        for (Room room : roomList) {
            if (room.getId() == id) {
                return room;
            }
        }
        return null;
    }
}
