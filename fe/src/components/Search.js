import React, { useState, useEffect } from "react";
import { searchByKeyword, getTotalPage } from "../api/ProductApi";
import { NavLink } from "react-router-dom";
import {ProductItem} from "./Home";

const Search = (props) => {
  const [products, setProducts] = useState([]);
  const [total, setTotal] = useState({});

  useEffect(() => {
    searchByKeyword(1, 10, props.keyword).then((response) =>
      setProducts(response.data)
    );
    getTotalPage().then((res) => setTotal(res.data));
  }, [props.keyword]);

  return (
    <div>
      {" "}
      <div className="container-fluid padding">
        <div className="row welcome mini-card">
          <div className="text-danger">
            <h4 className="title">Kết quả tìm kiếm</h4>
          </div>
        </div>
      </div>
      <div className="col-11 container-fluid card">
        <div className="row padding d-flex">
          {products.length === 0 && (
            <div className="error-template">
              <h5 style={{textAlign: 'center'}}>Không sản phẩm nào được tìm thấy</h5>
            </div>
          )}
          {products &&
            products.map((item, index) => (
              <ProductItem item={item} key={index}></ProductItem>
            ))}
        </div>
      </div>
    </div>
  );
};

export default Search;
