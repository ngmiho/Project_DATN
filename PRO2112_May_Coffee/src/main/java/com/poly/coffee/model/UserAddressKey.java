package com.poly.coffee.model;


import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable

public class UserAddressKey implements Serializable {
    @Column(name = "user_id")
private Long userId;

    @Column(name = "address_id")
    private Long addressId;
}
