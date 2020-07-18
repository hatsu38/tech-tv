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
        <Jumbotron fluid className="bg--white">
          <Container>
            <h2 className="f4 font-bold gray--900 about--title ">見逃したIT勉強会の動画を<br />見つけよう</h2>
            <p className="gray--400">
              <strong>こんぱすちゅ〜ぶ</strong>は、過去に行われたIT勉強会のYouTubeLiveを紹介しているサイトです。
              <br />
              参加できなかった勉強会や、気になる勉強会探しにご利用ください。
            </p>
          </Container>
        </Jumbotron>
      </>
    )
  }
}
