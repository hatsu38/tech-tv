import React, { Component } from 'react'
import PropTypes from 'prop-types';
import EventCard from '../components/EventCard'

import { Container, Row } from 'react-bootstrap'

const propTypes = {
  events: PropTypes.array
}

export default class EventCards extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const events = this.props.events

    return (
      <Row>
        {events && events.map((event, index) => <EventCard event={event} key={`${event.id}/${index}`} />)}
      </Row>
    )
  }
}

EventCards.propTypes = propTypes
