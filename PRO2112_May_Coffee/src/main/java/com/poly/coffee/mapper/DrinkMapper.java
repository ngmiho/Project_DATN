package com.poly.coffee.mapper;

import com.poly.coffee.dto.request.DrinkRequest;
import com.poly.coffee.dto.response.DrinkResponse;
import com.poly.coffee.entity.Drink;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface DrinkMapper {

    @Mapping(target = "drinkSizes", ignore = true)
    Drink toDrink(DrinkRequest request);

    @Mapping(target = "drinkSizes", ignore = true)
    void updateDrink(@MappingTarget Drink drink, DrinkRequest request);

    DrinkResponse toDrinkResponse(Drink drink);
}
