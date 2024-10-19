package com.poly.coffee.service;

import com.poly.coffee.dto.request.BankRequest2;
import com.poly.coffee.dto.response.BankResponse2;

import java.util.List;

public interface BankService2 {
    List<BankResponse2>  getAll();
    BankResponse2 getById(Integer id);
    BankResponse2 create(BankRequest2 request);
    BankResponse2 update(Integer id, BankRequest2 request);
    void delete(Integer id);
}
