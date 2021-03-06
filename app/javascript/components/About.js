import React, { Component } from 'react'
import { Jumbotron, Container } from "react-bootstrap"

import '../stylesheets/components/about'

export default class About extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <>
        <Jumbotron fluid className="bg--white about--wrapper marginless">
          <Container>
            <h2 className="f4 font-bold base_color about--title ">
              見逃したIT勉強会の動画を<br className="br--mobile-none"/>見つけよう
            </h2>
            <p className="gray--800">
              <strong>Tech-TV</strong>は、過去に行われたIT勉強会のYouTubeを紹介しているサイトです。
              <br />
              参加できなかった勉強会や、気になる勉強会探しにご利用ください。
            </p>
          </Container>
        </Jumbotron>
      </>
    )
  }
}
