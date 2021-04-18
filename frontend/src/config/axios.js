import axios from 'axios'

let baseURL = ''
if (process.env.NODE_ENV === 'production') {
  baseURL = ''
} else {
  baseURL = ''
}

export const Axios = axios.create({
  baseURL: baseURL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json'
  }
})
