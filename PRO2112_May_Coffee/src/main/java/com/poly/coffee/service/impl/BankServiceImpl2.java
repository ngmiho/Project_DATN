package com.poly.coffee.service.impl;

import com.poly.coffee.dto.request.BankRequest2;
import com.poly.coffee.dto.response.BankResponse2;
import com.poly.coffee.entity.Bank2;
import com.poly.coffee.exception.AppException;
import com.poly.coffee.exception.ErrorCode;
import com.poly.coffee.mapper.BankMapper2;
import com.poly.coffee.repository.BankRepository2;
import com.poly.coffee.service.BankService2;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BankServiceImpl2 implements BankService2 {

    BankRepository2 repository;
    BankMapper2 mapper;


    @Override
    public List<BankResponse2> getAll() {
        return repository.findAll().stream().map(mapper::toBankResponse2).collect(Collectors.toList());
    }

    @Override
    public BankResponse2 getById(Integer id) {
        return mapper.toBankResponse2(repository.findById(id).orElseThrow(() -> new AppException(ErrorCode.BANK_NOT_FOUND)));
    }

    @Override
    public BankResponse2 create(BankRequest2 request) {
        return mapper.toBankResponse2(repository.save(mapper.toBank(request)));
    }

    @Override
    public BankResponse2 update(Integer id, BankRequest2 request) {
        Bank2 bank = repository.findById(id).orElseThrow(() -> new AppException(ErrorCode.BANK_NOT_FOUND));
        mapper.updateBank2(bank, request);
        repository.save(bank);
        return mapper.toBankResponse2(bank);
    }

    @Override
    public void delete(Integer id) {
        repository.delete(repository.findById(id).orElseThrow(() -> new AppException(ErrorCode.BANK_NOT_FOUND)));
    }
}
