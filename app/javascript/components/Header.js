import React, { Component } from 'react'

import { Navbar, Container } from 'react-bootstrap';

export default class Header extends Component {
  render() {
    return (
      <>
        <Navbar className="base_bg_color">
          <Container>
            <Navbar.Brand href="/" className="bland-title white-text">
              Tech-TV
            </Navbar.Brand>
          </Container>
        </Navbar>
      </>
    )
  }
}
