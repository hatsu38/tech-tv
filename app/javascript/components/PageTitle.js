import React, { Component } from 'react'
import PropTypes from 'prop-types'

import "../stylesheets/components/page_title"

const propTypes = {
  eventCount: PropTypes.number,
  title: PropTypes.string.isRequired,
  link: PropTypes.string
}

export default class PageTitle extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { eventCount, title, link } = this.props
    const spanTitle = <span className="event-list-title gray--900 mr-10">{title}</span>
    return (
      <>
        <div className="" className="padding-sm mt-10">
          {link ? <a href={link}>{spanTitle}</a> : spanTitle}
          {eventCount && <span>{eventCount}件</span>}
        </div>
      </>
    )
  }
}

PageTitle.propTypes = propTypes