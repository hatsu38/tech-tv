import React, { Component } from 'react'
import PropTypes from 'prop-types'

import "../stylesheets/components/page_title"

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
        <div className="" className="padding-sm mt-10">
          <span className="event-list-title gray--900 mr-10">{title}</span>
          <span>{eventCount}件</span>
        </div>
      </>
    )
  }
}

PageTitle.propTypes = propTypes