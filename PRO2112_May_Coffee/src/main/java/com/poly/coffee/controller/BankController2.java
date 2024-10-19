package com.poly.coffee.controller;

import com.poly.coffee.constant.StatusCode;
import com.poly.coffee.dto.request.BankRequest2;
import com.poly.coffee.dto.response.ApiResponse;
import com.poly.coffee.dto.response.BankResponse2;
import com.poly.coffee.service.BankService2;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/banks2")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BankController2 {

    BankService2 service;

    @GetMapping
    public ApiResponse<List<BankResponse2>> getAll() {
        return ApiResponse.<List<BankResponse2>>builder().code(StatusCode.SUCCESS_CODE).result(service.getAll()).build();
    }

    @GetMapping("/{id}")
    public ApiResponse<BankResponse2> getById(@PathVariable("id") Integer id) {
        return ApiResponse.<BankResponse2>builder().code(StatusCode.SUCCESS_CODE).result(service.getById(id)).build();
    }

    @PostMapping
    public ApiResponse<BankResponse2> post(@RequestBody BankRequest2 request) {
        return ApiResponse.<BankResponse2>builder().code(StatusCode.SUCCESS_CODE).result(service.create(request)).build();
    }

    @PutMapping("/{id}")
    public ApiResponse<BankResponse2> put(@PathVariable("id") Integer id, @RequestBody BankRequest2 request) {
        return ApiResponse.<BankResponse2>builder().code(StatusCode.SUCCESS_CODE).result(service.update(id, request)).build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<String> delete(@PathVariable("id") Integer id) {
        service.delete(id);
        return ApiResponse.<String>builder().code(StatusCode.SUCCESS_CODE).message("Deleted successfully").build();
    }
}
