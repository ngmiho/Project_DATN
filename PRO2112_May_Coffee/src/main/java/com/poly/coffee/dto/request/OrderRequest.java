package com.poly.coffee.dto.request;

import com.poly.coffee.entity.Address;
import com.poly.coffee.entity.PaymentMethod;
import com.poly.coffee.entity.Voucher;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderRequest {
    Address address;
    PaymentMethod paymentMethod;
    Voucher voucher;
    Float feeShip;
}
