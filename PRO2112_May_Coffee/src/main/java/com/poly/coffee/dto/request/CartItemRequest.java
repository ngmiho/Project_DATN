package com.poly.coffee.dto.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CartItemRequest {

    Integer quantity;
    Double price;
    Long drinkId;
    Long sizeId;
    List<Long> toppings;
}
