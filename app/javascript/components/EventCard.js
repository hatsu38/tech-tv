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

  toEventDetailPage = () => {
    window.location = `/events/${this.props.event.id}`
  }

  render() {
    const event = this.props.event
    const tags = event.tags
    if(!event) {return null}

    return (
      <Card className="border-top-none">
        <Card.Body>
          <Card.Title className="cursor" onClick={this.toEventDetailPage}>{event.title}</Card.Title>
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