import React, { Component } from 'react'
import Login from './Login'
import Register from './Register'

export class Auth extends Component {
  render() {
    return (
      <div>
        <Login/>
        <Register/>
      </div>
    )
  }
}

export default Auth
