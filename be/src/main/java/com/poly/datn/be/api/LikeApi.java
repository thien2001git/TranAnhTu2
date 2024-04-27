package com.poly.datn.be.api;

import com.poly.datn.be.domain.payload.LikeRequest;
import com.poly.datn.be.entity.Account;
import com.poly.datn.be.entity.Like;
import com.poly.datn.be.entity.Product;
import com.poly.datn.be.repo.AccountRepo;
import com.poly.datn.be.repo.LikeRepo;
import com.poly.datn.be.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@CrossOrigin("*")
public class LikeApi {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    LikeRepo likeRepo;

    @Autowired
    AccountRepo accountRepo;

    @Autowired
    ProductRepo productRepo;

    @PostMapping("/api/site/like/count")
    public ResponseEntity<Integer> count(@RequestBody LikeRequest likeRequest) {
        int res = 0;
        try {
            Product product = productRepo.findById(Long.parseLong(likeRequest.getProduct_id())).get();
            List<Like> l = likeRepo.findAll();
            for (Like like : l) {
                if (Objects.equals(like.getProduct().getId(), product.getId())) {
                    ++res;
                }
            }
            System.out.println(String.format("LikeApi count %s %s", likeRequest.getProduct_id(), res));
        } catch (Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.badRequest().body(0);
        }
        return ResponseEntity.ok(res);
    }

    @PostMapping("/api/site/like/add")
    public ResponseEntity<String> insert(@RequestBody LikeRequest likeRequest) {
        try {
            Like like = new Like();
            like.setId(System.currentTimeMillis());
            Account account = accountRepo.findById(Long.parseLong(likeRequest.getUser_id())).get();
            like.setAccount(account);
            Product product = productRepo.findById(Long.parseLong(likeRequest.getProduct_id())).get();
            like.setProduct(product);
            likeRepo.save(like);
        } catch (Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.badRequest().body("not ok");
        }
        return ResponseEntity.ok("ok");
    }

    @PostMapping("/api/site/like/rm")
    public ResponseEntity<String> remove(@RequestBody LikeRequest likeRequest) {
        try {
            Like like = new Like();
            like.setId(System.currentTimeMillis());
            Account account = accountRepo.findById(Long.parseLong(likeRequest.getUser_id())).get();
            like.setAccount(account);
            Product product = productRepo.findById(Long.parseLong(likeRequest.getProduct_id())).get();
            like.setProduct(product);
            likeRepo.delete(like);
        } catch (Exception ex) {
            ex.printStackTrace();
            return ResponseEntity.badRequest().body("not ok");
        }
        return ResponseEntity.ok("ok");
    }

    @PostMapping("/api/site/like/check")
    public ResponseEntity<Boolean> check(@RequestBody LikeRequest likeRequest) {
        System.out.println("LikeApi check " + likeRequest.toString());
        try {
            List<Like> likeList = likeRepo.findAll();
            for (Like like : likeList) {
                if (like.getAccount().getId() == Long.parseLong(likeRequest.getUser_id())) {
                    if (like.getProduct().getId() == Long.parseLong(likeRequest.getProduct_id())) {
                        return ResponseEntity.ok(true);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ResponseEntity.ok(false);
    }
}
