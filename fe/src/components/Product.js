import React, {useState, useEffect} from "react";
import {getAllProducts, filterProducts} from "../api/ProductApi";
import {NavLink} from "react-router-dom";
import "./sidebar/sidebar.css";
import {ProductItem} from "./Home";

const categories = [
  {
    display_name: "Nam",
    value: "1",
  },
  {
    display_name: "Nữ",
    value: "2",
  },
  {
    display_name: "Trẻ em",
    value: "3",
  },
  {
    display_name: "Đá bóng",
    value: "4",
  },
  {
    display_name: "Thời trang",
    value: "5",
  },
  {
    display_name: "Bóng rổ",
    value: "6",
  },
  {
    display_name: "Chạy bộ",
    value: "7",
  },
];

const brands = [
  {
    img: "Laptop Samsung.png",
    display_name: "Samsung",
    value: "1",
  },
  {
    img: "MacBook.png",
    display_name: "Mac book",
    value: "2",
  },
  {
    img: "Laptop Dell.png",
    display_name: "Dell",
    value: "3",
  },
  {
    img: "Laptop HP.png",
    display_name: "Hp",
    value: "4",
  },
];

const prices = [
  {
    display_name: "Dưới 1 triệu",
    value: "0",
    min: 0,
    max: 1000000,
  },
  {
    display_name: "1.000.000 - 2.000.000",
    value: "1",
    min: 1000000,
    max: 2000000,
  },
  {
    display_name: "2.000.000 - 3.000.000",
    value: "2",
    min: 2000000,
    max: 3000000,
  },
  {
    display_name: "3.000.000 - 4.000.000",
    value: "3",
    min: 3000000,
    max: 4000000,
  },
  {
    display_name: "Trên 4 triệu",
    value: "4",
    min: 4000000,
    max: 1e10,
  },
];

const count = 12;

export default class Product extends React.Component {
  _isMounted = false;
  _products = []
  _count = 0

  constructor(props) {
    super(props);
    this.state = {
      brand: -1,
      category: -1,
      price: {min: 0, max: 1e10},
      page: 1,
      total: 1,
    }
  }

  componentDidMount() {
    this._isMounted = true;
    const {page} = this.state;
    getAllProducts(page, count, true).then((response) => {
      const safe = []
      const safe_ = new Set();
      response.data.forEach((it, id) => {
        try {
          require(`../static/images/${it.image}`)
          if (!safe_.has(it.id)) {
            safe_.add(it.id)
            safe.push(it)
          }
        } catch (ex) {
          if (localStorage.getItem("isLog") === "true") {
            console.log("not load ", it.image)
          }
        }
      })
      if (this._isMounted) {
        this._products = safe.slice(0, 12)
        this.setState({
          allProducts: safe,
          products: {left: safe.slice(0, 12), right: -1},
          total: 9
        })
      }
    });
  }

  update(myState) {
    this._count++
    var {allProducts, products} = this.state
    var {brand, category, price, page} = myState
    var safe = []
    const safe_ = new Set();
    if (allProducts !== undefined) {
      for (let i = 0; i < allProducts.length; i++) {
        const it = allProducts[i]
        const checkBrand = brand !== -1 && it.brand.toLowerCase() === brand.display_name.toLowerCase();
        const checkCategory = category !== -1 && it.category.toLowerCase() === category.display_name.toLowerCase();
        const checkPrice = price !== -1 && price.min <= it.price && it.price <= price.max
        if (checkBrand || checkCategory || checkPrice) {
          if (!safe_.has(it.id)) {
            safe_.add(it.id)
            safe.push(it)
          }
        }
      }

      if (safe.length === 0) {
        safe = allProducts
      }
      console.log("safe", safe)
      console.log("page", page)
      const page_ = page - 1
      if (products.left !== -1) {
        products = {left: -1, right: safe.slice(12 * page_, 12 * page_ + 12)}
      } else {
        products = {left: safe.slice(12 * page_, 12 * page_ + 12), right: -1}
      }
      this.setState({
        category: category,
        price: price,
        brand: brand,
        page: page,
        products: products,
        count: this._count
      })
    }
  }

  componentWillUnmount() {
    this._isMounted = false;
  }

  chooseBrandHandler(value) {
    this.update({
      category: -1,
      price: -1,
      brand: this.state.brand === value ? -1 : value,
      page: this.state.page
    })
  }

  chooseCategoryHandler(value) {
    this.update({
      category: this.state.category === value ? -1 : value,
      price: -1,
      brand: -1,
      page: this.state.page
    })
  }

  choosePriceHandler(item) {
    this.update({
      category: -1,
      price: this.state.price === item ? -1 : item,
      brand: -1,
      page: this.state.page
    })
  }

  onChangePage(index) {
    this.update({
      category: this.state.category,
      price: this.state.price,
      brand: this.state.brand,
      page: index
    })
  }

  render() {
    var {brand, category, price, products, total, page} = this.state

    if (localStorage.getItem("isLog") === "true") {
      console.log("products", products)
    }
    const rows = new Array(total).fill(0).map((zero, index) => (
      <li
        className={page === index + 1 ? "page-item active" : "page-item"}
        key={index}
      >
        <button className="page-link" onClick={this.onChangePage.bind(this, index + 1)}>
          {index + 1}
        </button>
      </li>
    ));

    return (
      <>
        <div>
          <div className="mt-5">
            <div className="row">
              <div className="col-2.5">
                <div className="col mini-card">
                  <h4 className="text-danger fw-bolder">Thương hiệu</h4>
                  <ul className="list-group">
                    {brands.map((item, index) => (
                      <div
                        className="sidebar__item"
                        key={index}
                        onClick={this.chooseBrandHandler.bind(this, item)}
                      >
                        <div
                          className={
                            brand === item
                              ? `sidebar__item-inner active`
                              : `sidebar__item-inner`
                          }
                        >
                          <i className={"bx"}><img alt={item.img} style={{width: '2em', height:'2em'}} src={require(`../static/images/${item.img}`)}/></i>
                          <span>{item.display_name}</span>
                        </div>
                      </div>
                    ))}
                  </ul>
                </div>
                <div className="col mt-3 mini-card">
                  <h4 className="text-danger fw-bolder">Giá</h4>
                  <ul className="list-group">
                    {prices.map((item, index) => (
                      <div className="sidebar__item" key={index}>
                        <div
                          className={
                            price === item
                              ? `sidebar__item-inner active`
                              : `sidebar__item-inner`
                          }
                          onClick={this.choosePriceHandler.bind(this, item)}
                        >
                          <i className={"bx bx-category-alt"}></i>
                          <span>{item.display_name}</span>
                        </div>
                      </div>
                    ))}
                  </ul>
                </div>
              </div>
              <div className="col">
                <div className="container-fluid padding">
                  <div className="container-fluid padding">
                    <div className="row welcome mini-card">
                      <h4 className="title text-danger">Sản phẩm nổi bật</h4>
                    </div>
                  </div>
                  <div className="row padding">
                    {products && products.left !== -1 &&
                      products.left.map((item, index) => (
                        <ProductItem item={item} key={index}/>
                      ))}

                    {products && products.right !== -1 &&
                      products.right.map((item, index) => (
                        <ProductItem item={item} key={index}/>
                      ))}

                  </div>
                </div>
              </div>
            </div>

            <div className="d-flex justify-content-center mt-5">
              <nav aria-label="Page navigation example">
                <ul className="pagination offset-5">
                  <li className={page === 1 ? "page-item disabled" : "page-item"}>
                    <button className="page-link" onClick={this.onChangePage.bind(this, 1)}>
                      First
                    </button>
                  </li>
                  {rows}
                  <li
                    className={page === total ? "page-item disabled" : "page-item"}
                  >
                    <button
                      className="page-link"
                      onClick={this.onChangePage.bind(this, total)}
                    >
                      Last
                    </button>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </>
    )
  }
}
