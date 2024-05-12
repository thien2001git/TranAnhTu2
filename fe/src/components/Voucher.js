import React from "react";
import {getVouchers} from "../api/VoucherApi";
import {NavLink} from "react-router-dom";


export default class Voucher extends React.Component {
  constructor() {
    super();
    this.state = {
      voucher: undefined,
      total: undefined,
      page: 1
    }
  }

  componentDidMount() {
    this.update(1)
  }

  update(page) {
    getVouchers(page, 9).then((res) => {
      this.setState({
        voucher: res.data.content,
        total: res.data.totalPages,
      })
    })
  }

  onChangePage(page) {
    this.setState({
      page: page
    })
    this.update(page)
  }

  render() {

    var ret = <></>
    if (this.state !== undefined) {
      const {voucher, total, page} = this.state

      var rows = new Array(total).fill(0).map((zero, index) => (
        <li
          className={page === index + 1 ? "page-item active" : "page-item"}
          key={index}
        >
          <button
            className="page-link"
            style={{borderRadius: 50}}
            onClick={this.onChangePage.bind(this, index + 1)}
          >
            {index + 1}
          </button>
        </li>
      ));
      ret = <>
        <table className="table table-bordered">
          <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Code</th>
            <th scope="col">Giảm giá(%)</th>
            <th scope="col">Lượt sử dụng</th>
            <th scope="col">Ngày hết hạn</th>
            <th scope="col">Trạng thái</th>
          </tr>
          </thead>
          <tbody>
          {voucher &&
            voucher.map((item, index) => (
              <tr key={index}>
                <th scope="row">{index + 1}</th>
                <td>{item.code}</td>
                <td>{item.discount}</td>
                <td>{item.count}</td>
                <td>{item.expireDate}</td>
                <td>{item.isActive ? "Hoạt động" : "Không hoạt động"}</td>
              </tr>
            ))}
          </tbody>
        </table>
        <nav aria-label="Page navigation">
          <ul className="pagination offset-5 mt-3">
            <li className={page === 1 ? "page-item disabled" : "page-item"}>
              <button
                className="page-link"
                style={{borderRadius: 50}}
                onClick={this.onChangePage.bind(this, 0)}
              >
                {`<<`}
              </button>
            </li>
            {rows}
            <li className={page === total ? "page-item disabled" : "page-item"}>
              <button
                className="page-link"
                style={{borderRadius: 50}}
                onClick={this.onChangePage.bind(this, total)}
              >
                {`>>`}
              </button>
            </li>
          </ul>
        </nav>
      </>
    }
    return (
      <>{ret}</>
    )
  }
}