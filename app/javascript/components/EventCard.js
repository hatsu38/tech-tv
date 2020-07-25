import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card } from 'react-bootstrap';

import HoldingDateTime from '../components/HoldingDateTime'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'
import Tags from '../components/Tags'

const propTypes = {
  event: PropTypes.object.isRequired,
}

export default class EventCard extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const event = this.props.event
    const tags = event.tags
    if(!event) {return null}

    return (
      <Card className="border-top-none">
        <Card.Body>
          <Card.Title className="cursor gray--800">
            <a href={'/events/' + event.id} className="gray--800">{event.title}</a>
          </Card.Title>
          <Card.Text className="text--light">
            <HoldingDateTime
              startDateTime={event.started_at}
              endDateTime={event.ended_at}
            />
          </Card.Text>
          <Card.Text className="text--light">
            <ApplicationAndCapacityCount event={event} />
          </Card.Text>
          {tags && <Tags tags={tags} />}
        </Card.Body>
      </Card>
    )
  }
}

EventCard.propTypes = propTypes