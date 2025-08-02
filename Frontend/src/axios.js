import axios from "axios";

const instance = axios.create({
  baseURL: process.env.VUE_APP_API_BASE, // sesuai .env kamu
  headers: {
    "Content-Type": "application/json",
    Accept: "application/json"
  }
});

export default instance;
