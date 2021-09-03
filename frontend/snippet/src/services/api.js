import axios from 'axios'

let url = ''  //please replace appropriate URL!
//Create an instance
const api = axios.create({
    baseURL: url, 
    setTimeout: 5000,
    headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
    }
})

// Add a request interceptor
api.interceptors.request.use(function (config) {
    const auth_token = localStorage.getItem('access')
    if (auth_token) {
        config.headers.common['Authorization'] = `Bearer ${auth_token}`
        return config
    }
    return config
  }, function (error) {
    return Promise.reject(error)
  })

// Add a response interceptor
api.interceptors.response.use(function (response) {
    return response
  }, function (error) {
    const token = localStorage.getItem('access')
    if (token != null) {
        console.log("session timeout!")
    } else {
        console.log("auth error")
    }
    return Promise.reject(error);
  });

export default api