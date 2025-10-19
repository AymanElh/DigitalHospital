package com.youcode.digitalhospital.dto.room;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RoomDTO {
    @NotNull(message = "Room number is required")
    @Positive(message = "Room must be positive")
    @Min(value = 1, message = "Room must be at least 1")
    private Long roomNumber;

    private Long id;


    private Boolean isAvailable;
}
