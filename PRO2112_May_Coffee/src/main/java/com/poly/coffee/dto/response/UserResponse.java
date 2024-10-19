package com.poly.coffee.dto.response;

import com.poly.coffee.enums.AuthTypeEnum;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserResponse {
    Long id;
    String email;
    String firstName;
    String lastName;
    String phoneNumber;
    Boolean isActive;
    AuthTypeEnum authType;
    LocalDate dob;
    Set<RoleResponse> roles;
}

