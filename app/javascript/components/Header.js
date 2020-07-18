import React, { Component } from 'react'

import { Navbar } from 'react-bootstrap';

export default class Header extends Component {
  render() {
    return (
      <>
        <Navbar className="bg-gray--600">
          <Navbar.Brand href="/" className="bland-title white-text">
            こんぱすちゅ〜ぶ
          </Navbar.Brand>
        </Navbar>
      </>
    )
  }
}
