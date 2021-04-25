import axios from 'axios'

let baseURL = ''
if (process.env.NODE_ENV === 'production') {
  baseURL = 'http://139.9.222.42:8000/api/'
} else {
  // baseURL = 'http://localhost:8000/'
  baseURL = 'http://139.9.222.42:8000/api/'
}

export const Axios = axios.create({
  baseURL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json'
  }
})
