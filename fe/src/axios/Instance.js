import axios from 'axios'

const Instance = axios.create({
    baseURL: "http://localhost:8080",
    headers:{
        "Content-Type" : "application/json",
        "Authorization": localStorage.getItem("token")
    }
});

export default Instance