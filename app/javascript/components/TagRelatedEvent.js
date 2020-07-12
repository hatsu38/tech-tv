import React, { Component } from 'react'
import PropTypes from 'prop-types'
import EventCards from '../components/EventCards'

const propTypes = {
  tag: PropTypes.object.isRequired
}

export default class TagRelatedEvent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const tag = this.props.tag
    const events = this.props.tag.events
    return (
      <>
        <div className="white--background border-top">
          <h2 className="f4 section-title-main-text mt-20 mb-0 pt-20 pb-20 pl-10 border-bottom">{tag.name}</h2>
          {events && <EventCards events={events} />}
        </div>
      </>
    )
  }
}

TagRelatedEvent.propTypes = propTypes