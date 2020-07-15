import React, { Component } from 'react'
import PropTypes from 'prop-types'
import EventCards from '../components/EventCards'
import PageTitle from '../components/PageTitle'

const propTypes = {
  tag: PropTypes.object.isRequired,
  events: PropTypes.array.isRequired
}

export default class TagRelatedEvent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const tag = this.props.tag
    const events = this.props.events
    return (
      <>
        <div className="white--background border-top">
          <PageTitle eventCount={events.length} title={tag.name} />
          <hr />
          {events && <EventCards events={events} />}
        </div>
      </>
    )
  }
}

TagRelatedEvent.propTypes = propTypes