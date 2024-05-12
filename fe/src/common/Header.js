import React from "react";
import "../static/css/style.css";
import logo from "../assets/images/logo-sneaker1.jpg";
import {NavLink, useHistory} from "react-router-dom";
import Dropdown from "../admin/dropdown/Dropdown";
import {toast} from "react-toastify";

const user_menu = [
  {
    icon: "bx bx-user",
    content: "Tài khoản",
    url: "/profile",
  },
  {
    icon: "bx bx-log-out-circle bx-rotate-180",
    content: "Đăng xuất",
    url: "/",
  },
];

const not_menu = [
  {
    icon: "bx bx-user",
    content: "Đăng nhập",
    url: "/sign-in",
  },
  {
    icon: "bx bx-cog",
    content: "Đăng kí",
    url: "/register",
  },
];

const Header = (props) => {
  const history = useHistory();

  const submitHandler = (e) => {
    e.preventDefault();
    props.searchHandler(e.target.keyword.value);
    history.push("/search-page");
  };
  const user = {
    username: localStorage.getItem("username"),
    password: localStorage.getItem("password"),
  }

  const signOutHandler = () => {
    props.refresh(false);
    toast.success("Tài khoản đã được đăng xuất.");
    localStorage.removeItem("token");
    localStorage.removeItem("username");
    localStorage.removeItem("password");
    props.userHandler(null);
  };

  var accountDrop = <div><a href={"/register"}>Đăng ký</a> | <a href={"/sign-in"}>Đăng nhập</a></div>
  if (user.username != null) {
    accountDrop = <div><a href={"/profile"}>Tài khoản</a> | <a href={"/"} onClick={signOutHandler}>Đăng xuất</a> | <a
      href={"/don-hang"}>Đơn hàng</a></div>
  }
  return (
    <>
      <div className="mini-card">
        {/* Navigation */}
        <nav className="navbar navbar-expand-md col-12">
          <div className="navbar-brand ml-1 col">
            <NavLink to={"/"}>
              <img src={logo} width={50} height={50} alt=""/>
            </NavLink>
          </div>
          <div className="collapse navbar-collapse col" style={{justifyContent: 'space-between'}}>
            <ul className="navbar-nav">
              <li
                className={
                  props.header === 1
                    ? "nav-item mr-2 active"
                    : "nav-item mr-2"
                }
              >
                <NavLink className="nav-link" to="/" exact>
                  Trang chủ
                </NavLink>
              </li>
              <li
                className={
                  props.header === 2
                    ? "nav-item mr-2 active"
                    : "nav-item mr-2"
                }
              >
                <NavLink className="nav-link" to="/store" exact>
                  Sản phẩm
                </NavLink>
              </li>
              <li
                className={
                  props.header === 3
                    ? "nav-item mr-2 active"
                    : "nav-item mr-2"
                }
              >
                <NavLink className="nav-link" to="/cart" exact>
                  Giỏ hàng
                </NavLink>
              </li>
              {props.user && (
                <li
                  className={
                    props.header === 5
                      ? "nav-item mr-2 active"
                      : "nav-item mr-2"
                  }
                >
                  <NavLink className="nav-link" to="/order" exact>
                    Đơn hàng
                  </NavLink>
                </li>
              )}
              <li
                className={
                  props.header === 4
                    ? "nav-item mr-2 active"
                    : "nav-item mr-2"
                }
              >
                <NavLink className="nav-link" to="/blog" exact>
                  Chính sách
                </NavLink>
              </li>

              <li className={
                props.header === 4
                  ? "nav-item mr-2 active"
                  : "nav-item mr-2"
              }>
                <NavLink className="nav-link" to="/voucher" exact>
                  Voucher
                </NavLink>
              </li>

              {props.user && (
                <li
                  className={
                    props.header === 6
                      ? "nav-item mr-2 active"
                      : "nav-item mr-2"
                  }
                >
                  <NavLink className="nav-link" to="/chat" exact>
                    Hỏi đáp
                  </NavLink>
                </li>
              )}
            </ul>
            <form
              className="form-inline my-2 my-lg-0 mr-3 search-bar"
              onSubmit={(e) => submitHandler(e)}
            >
              <input
                className="form-control mr-sm-2"
                style={{borderRadius: "50px"}}
                type="search"
                aria-label="Search"
                name="keyword"
              />
              <button className={"btn btn-secondary search-btn"} style={{borderRadius: "50px"}}>
                <i
                  className={"fa fa-search"}
                  aria-hidden="true"
                  style={{fontSize: "16px"}}
                ></i>
              </button>
            </form>
            {accountDrop}
          </div>
        </nav>
      </div>
    </>
  );
};

export default Header;
