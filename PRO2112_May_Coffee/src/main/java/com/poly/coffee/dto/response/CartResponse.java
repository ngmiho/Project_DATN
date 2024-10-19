package com.poly.coffee.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartResponse {
    Long id;
    Integer totalItems;
    Double totalPrice;
    UserResponse user;
    List<CartItemResponse> cartItems;
}
