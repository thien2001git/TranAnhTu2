package com.poly.datn.be.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "like")
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Like {
    @Id
    private Long id;
    @ManyToOne
    private Account account;
    @ManyToOne
    private Product product;
}
