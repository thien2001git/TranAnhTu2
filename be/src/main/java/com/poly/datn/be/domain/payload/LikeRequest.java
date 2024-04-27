package com.poly.datn.be.domain.payload;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class LikeRequest {
    @NotBlank
    private String user_id;
    @NotBlank
    private String product_id;
}
