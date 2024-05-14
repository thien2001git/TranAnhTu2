import addidas from "../static/images/Laptop Acer.png";
import nike from "../static/images/Laptop Asus.png";
import puma from "../static/images/Laptop Dell.png";
import fila from "../static/images/Laptop HP.png";
import {NavLink, useHistory} from "react-router-dom";
import first from "../static/images/slider_1_image.jpg";
import second from "../static/images/slider_2_image.jpg";
import third from "../static/images/slider_4_image.jpg";
import fourth from "../static/images/slider_5_image.jpg";
import React, {useState, useEffect} from "react";
import {getAllProducts} from "../api/ProductApi";
import {like, removeLike, checkLike, count} from "../api/LikeApi";

export class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      updateLike: props.updateLike, uid: localStorage.getItem("userid"), pid: props.pid, checked: false
    }
  }

  componentDidMount() {
    const {uid, pid} = this.state
    checkLike(`${uid}`, `${pid}`).then((res) => {
      this.setState({
        checked: res.data
      })
    })
  }

  clickHandler() {
    const {uid, pid, checked, updateLike} = this.state
    if (checked) {
      updateLike(-1)
    } else {
      updateLike(1)
    }

    this.setState({
      checked: !checked
    })
    if (uid !== undefined) {
      checkLike(`${uid}`, `${pid}`).then((res) => {
        if (res.data === false) {
          like(`${uid}`, `${pid}`)
        } else {
          removeLike(`${uid}`, `${pid}`)
        }
      })
    }
  }

  render() {
    var res = <i className="fa fa-heart" style={{color: "#000"}} onClick={this.clickHandler.bind(this)}></i>
    const {checked} = this.state
    if (checked) {
      res = <i className="fa fa-heart" style={{color: "#f00"}} onClick={this.clickHandler.bind(this)}></i>
    }
    return (<>
      {res}
    </>)
  }
}


export class ProductItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      item: props.item, countLike: 0
    }
  }

  componentDidMount() {
    count(`${this.state.item.id}`).then((res) => {
      this.setState({
        countLike: res.data
      })
    })
  }

  updateLike = (delta) => {
    var {countLike} = this.state
    countLike += delta
    this.setState({
      countLike: countLike
    })
  }

  render() {
    const {item, countLike} = this.state
    return (<>
      <div className="col-md-4 mb-3">
        <div className="card h-100 mini-pro">
          <div className="d-flex justify-content-between position-absolute w-100">
            <div className="label-new">
                      <span className="text-white bg-success small d-flex align-items-center px-2 py-1">
                        <i className="fa fa-star" aria-hidden="true"></i>
                        <span className="ml-1">New</span>
                      </span>
            </div>
          </div>
          <NavLink to={`/product-detail/${item.id}`}>
            <img
              src={require(`../static/images/${item.image}`)}
              style={{width: 150, height: 150}}
              alt="Product"
              className="mini-card"
            />
          </NavLink>
          <div className="card-body px-2 pb-2 pt-1">
            <div className="d-flex justify-content-between">
              <div>
                <p className="h4 text-primary mini-card" style={{fontSize: "large"}}>
                  {((item.price * (100 - item.discount)) / 100).toLocaleString()}{" "}
                  đ
                </p>
              </div>
            </div>
            <p className="text-warning d-flex align-items-center mb-2">
              <i className="fa fa-star" aria-hidden="true"></i>
              <i className="fa fa-star" aria-hidden="true"></i>
              <i className="fa fa-star" aria-hidden="true"></i>
              <i className="fa fa-star" aria-hidden="true"></i>
              <i className="fa fa-star" aria-hidden="true"></i>
            </p>
            <p className="mb-0">
              <strong>
                <NavLink
                  to={`/product-detail/${item.id}`}
                  className="text-secondary "
                >
                  {item.name}
                </NavLink>
              </strong>
            </p>
            <p className="mb-1">
              <small>
                <NavLink to="#" className="text-secondary ">
                  {item.brand}
                </NavLink>
              </small>
            </p>
            <div className="d-flex mb-3 justify-content-between">
              <div>
                <p className="mb-0 small">
                  <b>Yêu thích: </b> {countLike} lượt
                </p>
                <p className="mb-0 small">
                  <b>Giá gốc: {item.price.toLocaleString()} đ</b>
                </p>
                <p className="mb-0 small text-danger">
                  <span className="font-weight-bold">Tiết kiệm: </span>{" "}
                  {((item.price * item.discount) / 100).toLocaleString()}{" "}
                  đ ({item.discount}%)
                </p>
              </div>
            </div>
            <div className="d-flex justify-content-between">
              <div className="col px-0 ">
                <NavLink
                  to={`/product-detail/${item.id}`}
                  exact
                  className="btn btn-outline-primary btn-block"
                >
                  Thêm vào giỏ
                  <i
                    className="fa fa-shopping-basket"
                    aria-hidden="true"
                  ></i>
                </NavLink>
              </div>
              <div className="ml-2">
                <LikeButton pid={item.id} updateLike={this.updateLike.bind(this)}/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>)
  }
}

const Home = (props) => {
  const history = useHistory();
  const [products, setProducts] = useState([]);
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState({});
  const [active, setActive] = useState(true);

  var rows = new Array(total).fill(0).map((zero, index) => (<li
    className={page === index + 1 ? "page-item active" : "page-item"}
    key={index}
  >
    <button
      className="page-link"
      style={{borderRadius: 50}}
      onClick={() => onChangePage(index + 1)}
    >
      {index + 1}
    </button>
  </li>));

  useEffect(() => {
    getAllProducts(page, 12, active).then((response) => {
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
      setProducts(safe.slice(0, 12))
    });
    props.changeHeaderHandler(1);
  }, [page]);

  const onChangePage = (page) => {
    setPage(page);
  };

  const onBrandClick = (name) => {
    history.push("/store")
    console.log("brand", name)
    localStorage.setItem("brand", name)
  }

  const brand = [{
    name: "addidas", src: addidas
  }, {
    name: "nike", src: nike
  }, {
    name: "puma", src: puma
  }, {
    name: "fila", src: fila
  }]


  return (<div>
    {/* Carousel */}
    <div id="slides" className="carousel slide  mb-5" data-ride="carousel">
      <ul className="carousel-indicators">
        <li data-target="#slides" data-slide-to={0} className="active"/>
        <li data-target="#slides" data-slide-to={1}/>
        <li data-target="#slides" data-slide-to={2}/>
        <li data-target="#slides" data-slide-to={3}/>
      </ul>
      <div className="carousel-inner mini-card">
        <div className="carousel-item active">
          <img src={second} alt=""/>
        </div>
        <div className="carousel-item">
          <img src={first} alt=""/>
        </div>
        <div className="carousel-item">
          <img src={third} alt=""/>
        </div>
        <div className="carousel-item">
          <img src={fourth} alt=""/>
        </div>
      </div>
    </div>
    <div className="container-fluid padding">

      <div className="row text-center padding">
        {brand.map((value, index) => {
          return <div className="col-xs-12 col-sm-6 col-md-3 mini-card" key={index} onClick={() => {
            onBrandClick(value.name)
          }}>
            <img src={value.src} alt="" height={50}/>
          </div>
        })}
      </div>
    </div>
    <div className="container-fluid padding">
      <div className="row welcome mini-card">
        <h4 className="title text-primary">Mới nhất</h4>
      </div>
    </div>
    <div className="col-11 container-fluid card">
      <div className="row padding d-flex">
        {products && products.map((item, index) => (<ProductItem item={item} key={index}></ProductItem>))}
      </div>
    </div>
    {/* <div className="container-fluid padding mt-5">
        <div className="row welcome">
          <div className="text-danger">
            <h4 className="title">Xem nhiều nhất</h4>
          </div>
        </div>
      </div>
      <div className="container padding">
        <div className="row padding d-flex">
        {products &&
            products.map((item, index) => (
              <div className="col-md-4 mb-3" key={index}>
                <div className="card h-100">
                  <div className="d-flex justify-content-between position-absolute w-100">
                    <div className="label-new">
                      <span className="text-white bg-success small d-flex align-items-center px-2 py-1">
                        <i className="fa fa-star" aria-hidden="true"></i>
                        <span className="ml-1">New</span>
                      </span>
                    </div>
                    <div className="label-sale">
                      <span className="text-white bg-primary small d-flex align-items-center px-2 py-1">
                        <i className="fa fa-tag" aria-hidden="true"></i>
                        <span className="ml-1">Sale</span>
                      </span>
                    </div>
                  </div>
                  <NavLink to={`/product-detail/${item.id}`}>
                    <img
                      src={require(`../static/images/${item.imageLink}`)}
                      style={{ width: 150, height: 150 }}
                      alt="Product"
                    />
                  </NavLink>
                  <div className="card-body px-2 pb-2 pt-1">
                    <div className="d-flex justify-content-between">
                      <div>
                        <p className="h4 text-primary">
                          {item.price.toLocaleString()} Đ
                        </p>
                      </div>
                    </div>
                    <p className="text-warning d-flex align-items-center mb-2">
                      <i className="fa fa-star" aria-hidden="true"></i>
                      <i className="fa fa-star" aria-hidden="true"></i>
                      <i className="fa fa-star" aria-hidden="true"></i>
                      <i className="fa fa-star" aria-hidden="true"></i>
                      <i className="fa fa-star" aria-hidden="true"></i>
                    </p>
                    <p className="mb-0">
                      <strong>
                        <NavLink to={`/product-detail/${item.id}`} className="text-secondary">
                          {item.name}
                        </NavLink>
                      </strong>
                    </p>
                    <p className="mb-1">
                      <small>
                        <NavLink to="#" className="text-secondary">
                          {item.brand}
                        </NavLink>
                      </small>
                    </p>
                    <div className="d-flex mb-3 justify-content-between">
                      <div>
                        <p className="mb-0 small">
                          <b>Yêu thích: </b> {item.view} lượt
                        </p>
                        <p className="mb-0 small">
                          <b>Giá gốc: </b> {item.price.toLocaleString()} Đ
                        </p>
                        <p className="mb-0 small text-danger">
                          <span className="font-weight-bold">Tiết kiệm: </span> 0 đ (0%)
                        </p>
                      </div>
                    </div>
                    <div className="d-flex justify-content-between">
                      <div className="col px-0">
                        <NavLink
                          to={`/product-detail/${item.id}`}
                          exact
                          className="btn btn-outline-primary btn-block"
                        >
                          Thêm vào giỏ
                          <i
                            className="fa fa-shopping-basket"
                            aria-hidden="true"
                          ></i>
                        </NavLink>
                      </div>
                      <div className="ml-2">
                        <NavLink
                          to="#"
                          className="btn btn-outline-success"
                          data-toggle="tooltip"
                          data-placement="left"
                          title="Add to Wishlist"
                        >
                          <i className="fa fa-heart" aria-hidden="true"></i>
                        </NavLink>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
        </div>
      </div> */}
  </div>);
};

export default Home;
