import axios from 'axios'

let baseURL = ''
if (process.env.NODE_ENV === 'production') {
  baseURL = 'https://csu21api.54sher.com/api/'
} else {
  baseURL = 'http://localhost:8000/'
}

export const Axios = axios.create({
  baseURL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json'
  }
})
