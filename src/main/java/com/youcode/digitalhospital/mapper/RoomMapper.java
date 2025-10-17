package com.youcode.digitalhospital.mapper;

import com.youcode.digitalhospital.dto.room.RoomDTO;
import com.youcode.digitalhospital.model.Room;

public class RoomMapper {
    public static Room toEntity(RoomDTO roomDTO) {
        if (roomDTO == null) {
            return null;
        }

        Room room = new Room();
        room.setRoomNumber(roomDTO.getRoomNumber());
        room.setAvailable(roomDTO.getIsAvailable());

        return room;
    }

    public static RoomDTO toDTO(Room room) {
        if (room == null) {
            return null;
        }

        RoomDTO dto = new RoomDTO();
        dto.setId(room.getId());
        dto.setRoomNumber(room.getRoomNumber());
        dto.setIsAvailable(room.isAvailable());

        return dto;
    }
}
