import React, { Component } from 'react'

import { Navbar } from 'react-bootstrap';

export default class Header extends Component {
  render() {
    return (
      <>
        <Navbar className="base_bg_color">
          <Navbar.Brand href="/" className="bland-title white-text">
            こんぱすちゅ〜ぶ
          </Navbar.Brand>
        </Navbar>
      </>
    )
  }
}
