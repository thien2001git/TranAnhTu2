import React from "react";
import {getAllOrder} from "../api/OrderApi";
import {NavLink} from "react-router-dom";
import {Badge} from "@mui/material";

const pendingStatus = {
  true: "success",
  false: "danger",
};

export default class Bill extends React.Component {
  constructor() {
    super();
    this.state = {
      page: 1
    }
  }

  componentDidMount() {
    this.update(1)
  }

  update(page) {
    const id = localStorage.getItem("userid")
    console.log("id", id)
    for (let i = 1; i <= 5; i++) {
      getAllOrder(id, i, page, 999999).then((res) => {
        console.log("res.data.content", res.data.content)
        console.log("res.data.totalPages", res.data.totalPages)
        if (i === 1) {
          this.setState({
            bill1: res.data.content,
          })
        }
        if (i === 2) {
          this.setState({
            bill2: res.data.content,
          })
        }
        if (i === 3) {
          this.setState({
            bill3: res.data.content,
          })
        }
        if (i === 4) {
          this.setState({
            bill4: res.data.content,
          })
        }
        if (i === 5) {
          this.setState({
            bill5: res.data.content,
          })
        }

      })
    }
  }

  render() {
    var ret = <></>
    if (this.state !== undefined) {
      const {bill1, bill2, bill3, bill4, bill5} = this.state
      const show = (item) => {
        return (
          <>
            {item && (
              <div>
                <div className="table-wrapper">
                  <table>
                    <thead>
                    <tr>
                      <th scope="col">Mã đơn hàng</th>
                      <th scope="col">Ngày mua</th>
                      <th scope="col">Thanh toán</th>
                      <th scope="col">Tổng tiền</th>

                    </tr>
                    </thead>
                    <tbody>
                    {item &&
                      item.map((item, index) => (
                        <tr key={index}>
                          <th scope="row">
                            <NavLink to={`/detail-order/${item.id}`} exact>
                              #OD{item.id}
                            </NavLink>
                          </th>
                          <th>{item.createDate}</th>
                          <th style={{color: item.isPending ? "green": "red"}}>
                            {
                              item.isPending
                                ? "Đã thanh toán"
                                : "Chưa thanh toán"
                            }
                          </th>
                          <th> {item.total.toLocaleString()} ₫</th>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}
          </>
        )
      }

      ret = <>
        <h2>Đơn hàng tạo mới</h2>
        {show(bill1)}
        <h2>Đơn hàng đang được xử lí</h2>
        {show(bill2)}
        <h2>Đơn hàng đang vận chuyển</h2>
        {show(bill3)}
        <h2>Đơn hàng giao thành công</h2>
        {show(bill4)}
        <h2>Đơn hàng đã hủy</h2>
        {show(bill5)}
      </>
    }
    return (
      <>
        {ret}
      </>
    )
  }
}