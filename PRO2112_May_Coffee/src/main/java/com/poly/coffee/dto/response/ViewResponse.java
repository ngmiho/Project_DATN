package com.poly.coffee.dto.response;

import com.poly.coffee.entity.Category;
import com.poly.coffee.entity.DrinkSize;
import com.poly.coffee.entity.Topping;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ViewResponse {
    Long id;
    List<String> images;
}
