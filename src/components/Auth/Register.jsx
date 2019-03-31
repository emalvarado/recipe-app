import React, { Component } from "react";
import Form from "react-bootstrap/Form";
import InputGroup from "react-bootstrap/InputGroup";
import Button from "react-bootstrap/Button";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";

class Register extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      validated: false,
      email: '',
      password: '',
      passConfirm: '',
      match: true
    };
  }

  handleChange(prop, val) {
    this.setState({
      [prop]: val
    })
  }

  handleSubmit(event) {
    const form = event.currentTarget;
    if (form.checkValidity() === false) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.setState({ validated: true });

  }

  render() {
    const { validated } = this.state;
    return (
      <Form
        noValidate
        validated={validated}
        onSubmit={e => this.handleSubmit(e)}
      >
        <Form.Group as={Row} controlId="formHorizontalEmail">
          <Form.Label column sm={2}>
            Email
          </Form.Label>
          <Col sm={10}>
            <Form.Control
              required
              type="text"
              placeholder="Email"
              value={this.state.email}
              onChange={e => this.handleChange('email', e.target.value)}
            />
          <Form.Control.Feedback>Looks good!</Form.Control.Feedback>
          </Col>
        </Form.Group>
        <Form.Group as={Row} controlId="formHorizontalPassword">
          <Form.Label column sm={2}>
            Password
          </Form.Label>
          <Col sm={10}>
            <Form.Control 
            required
            type="password" 
            placeholder="Password" 
            value={this.state.password}
            onChange={e => this.handleChange('password', e.target.value)}
            />
            
          <Form.Control.Feedback>Looks good!</Form.Control.Feedback>
          </Col>
        </Form.Group>
        <Form.Group as={Row} controlId="formHorizontalPassword">
          <Form.Label column sm={2}>
            Confirm Password
          </Form.Label>
          <Col sm={10}>
            <Form.Control 
            required={this.state.match}
            type="password" 
            placeholder="Confirm Password" 
            value={this.state.passConfirm}
            onChange={e => this.handleChange('passConfirm', e.target.value)}
            />
          <Form.Control.Feedback type='valid'>Looks good!</Form.Control.Feedback>
          <Form.Control.Feedback type="invalid">
              Passwords must match.
            </Form.Control.Feedback>
          </Col>
        </Form.Group>
        <Button type="submit">Register</Button>
      </Form>
    );
  }
}

export default Register;
