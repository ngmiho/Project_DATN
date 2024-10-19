package com.poly.coffee.service.impl;

import com.poly.coffee.entity.Drink;
import com.poly.coffee.entity.DrinkSize;
import com.poly.coffee.repository.DrinkSizeRepository;
import com.poly.coffee.service.DrinkSizeService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Service
public class DrinkSizeServiceImpl implements DrinkSizeService {

    DrinkSizeRepository drinkSizeRepository;

    @Override
    public void deleteNotInUpdatedDrinkSizes(Drink drink, List<DrinkSize> updatedDrinkSizes) {
        List<DrinkSize> drinkSizes = drinkSizeRepository.findByDrinkId(drink.getId());
        List<DrinkSize> deleteDrinkSizes = drinkSizes.stream().filter(drinkSize -> !updatedDrinkSizes.contains(drinkSize)).toList();

        drinkSizeRepository.deleteAllByIdInBatch(deleteDrinkSizes.stream()
                .map(DrinkSize::getId)
                .collect(Collectors.toList()));
    }
}
