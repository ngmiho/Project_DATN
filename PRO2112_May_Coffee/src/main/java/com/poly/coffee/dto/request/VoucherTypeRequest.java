package com.poly.coffee.dto.request;

import com.poly.coffee.entity.Voucher;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class VoucherTypeRequest {
    String name;
    List<Voucher> vouchers;
}
