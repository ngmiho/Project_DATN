package com.poly.coffee.service.impl;

import com.poly.coffee.dto.request.PaymentMethodBankRequest;
import com.poly.coffee.dto.response.PaymentMethodBankResponse;
import com.poly.coffee.entity.Bank;
import com.poly.coffee.entity.Order;
import com.poly.coffee.entity.PaymentMethod;
import com.poly.coffee.entity.PaymentMethodBank;
import com.poly.coffee.exception.AppException;
import com.poly.coffee.exception.ErrorCode;
import com.poly.coffee.mapper.PaymentMethodBankMapper;
import com.poly.coffee.repository.BankRepository;
import com.poly.coffee.repository.OrderRepository;
import com.poly.coffee.repository.PaymentMethodBankRepository;
import com.poly.coffee.repository.PaymentMethodRepository;
import com.poly.coffee.service.PaymentMethodBankService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PaymentMethodBankServiceImpl implements PaymentMethodBankService {

    PaymentMethodBankRepository repository;
    PaymentMethodRepository paymentMethodRepository;
    BankRepository bankRepository;
    OrderRepository orderRepository;
    PaymentMethodBankMapper mapper;


    @Override
    public List<PaymentMethodBankResponse> getAll() {
        return repository.findAll()
                .stream()
                .map(mapper::toPaymentMethodBankResponse)
                .collect(Collectors.toList());
    }

    @Override
    public PaymentMethodBankResponse getById(Long id) {
        return mapper.toPaymentMethodBankResponse(repository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PAYMENT_METHOD_NOT_FOUND)));
    }

    @Override
    public PaymentMethodBankResponse create(PaymentMethodBankRequest request) {
        PaymentMethod paymentMethod = paymentMethodRepository
                .findById(request.getPaymentMethodId())
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND));
        Bank bank = bankRepository
                .findById(request.getBankId())
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND));
        Order order = orderRepository.findById(request.getOrderId())
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND));

        PaymentMethodBank paymentMethodBank = mapper.toPaymentMethodBank(request);
        paymentMethodBank.setPaymentMethod(paymentMethod);
        paymentMethodBank.setBank((bank));
        paymentMethodBank.setOrder(order);

        return mapper.toPaymentMethodBankResponse(repository.save(paymentMethodBank));
    }

}
