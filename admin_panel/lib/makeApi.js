import axios from "axios";
import { getStorage } from "./storage";

export default async (path = "/", method = "GET", data = null) => {
    var options = {
        method: method,
        url: 'http://localhost:8000' + path,
        headers: {
            Accept: '*/*',
            Authorization: 'barer ' + (getStorage("auth") || "").toString(),
            'Content-Type': 'application/json'
        },
        data: data,
    };

    try {
        const response = await axios.request(options);
        return response.data;
    } catch (error) {
        throw error;
    }
}