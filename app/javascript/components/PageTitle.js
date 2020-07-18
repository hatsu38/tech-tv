import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { Card } from "react-bootstrap"

const propTypes = {
  eventCount: PropTypes.number.isRequired,
  title: PropTypes.string.isRequired
}

export default class PageTitle extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { eventCount, title } = this.props
    return (
      <>
        <Card className="text-center border-none gray--800">
          <Card.Body>
            <Card.Title className="f3 mb-10">{title}</Card.Title>
            <div className="eventCount">
              <strong>{eventCount}</strong>件のイベント
            </div>
          </Card.Body>
        </Card>
      </>
    )
  }
}

PageTitle.propTypes = propTypes