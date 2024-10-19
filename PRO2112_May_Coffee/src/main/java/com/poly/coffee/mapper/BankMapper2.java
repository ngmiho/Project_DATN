package com.poly.coffee.mapper;

import com.poly.coffee.dto.request.BankRequest2;
import com.poly.coffee.dto.response.BankResponse2;
import com.poly.coffee.entity.Bank2;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface BankMapper2 {
    Bank2 toBank(BankRequest2 request2);
    BankResponse2 toBankResponse2(Bank2 bank2);
    void updateBank2 (@MappingTarget Bank2 bank2, BankRequest2 request2);
}
