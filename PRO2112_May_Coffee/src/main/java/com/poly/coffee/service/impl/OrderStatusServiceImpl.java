package com.poly.coffee.service.impl;

import com.poly.coffee.dto.request.OrderStatusRequest;
import com.poly.coffee.dto.response.OrderStatusResponse;
import com.poly.coffee.entity.OrderStatus;
import com.poly.coffee.mapper.OrderStatusMapper;
import com.poly.coffee.repository.OrderStatusRepository;
import com.poly.coffee.service.OrderStatusService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Service
public class OrderStatusServiceImpl implements OrderStatusService {

    OrderStatusRepository repository;
    OrderStatusMapper mapper;

    @Override
    public List<OrderStatus> getAllOrderStatus() {
        return repository.findAll();
    }

    @Override
    public List<OrderStatus> getAll() {
        return repository.findAll();
    }

    @Override
    public OrderStatusResponse getById(Long id) {
        return mapper.toOrderStatusResponse(repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can not get order status!")));
    }

    @Override
    public OrderStatusResponse create(OrderStatusRequest request) {
        return mapper.toOrderStatusResponse(repository.save(mapper.toOrderStatus(request)));
    }

    @Override
    public OrderStatusResponse update(Long id, OrderStatusRequest request) {
        OrderStatus orderStatus = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can not update order status!"));
        mapper.updateOrderStatus(orderStatus, request);
        return mapper.toOrderStatusResponse(repository.save(orderStatus));
    }

    @Override
    public void delete(Long id) {
        repository.delete(repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can not delete order status!")));
    }
}
