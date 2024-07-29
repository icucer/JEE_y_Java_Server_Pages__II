package cl.praxis.desafio2.model;

import lombok.*;

@Data
@AllArgsConstructor
public class Room {
    private int id;
    private String name;
    private String description;
    private String image;
    private int price;
    private int rooms;
    private int rooms_area;
}
