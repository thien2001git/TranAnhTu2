import axios from 'axios'

export const getAllProvince = () =>{
    return axios.create({
        baseURL: "https://vn-public-apis.fpo.vn/provinces/getAll?limit=-1",
        headers:{
            "Content-Type" : "application/json"
        }
    }).get("/getAll?limit=-1");
}