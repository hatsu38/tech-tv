import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card, Badge } from 'react-bootstrap';

import HoldingDateTime from '../components/HoldingDateTime'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'

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
      <>
        <Card className="border-top-none">
          <Card.Body>
            <Card.Title>{event.title}</Card.Title>
            <Card.Text className="text--light">
              <HoldingDateTime
                startDateTime={event.started_at}
                endDateTime={event.ended_at}
              />
            </Card.Text>
            <Card.Text className="text--light">
              <ApplicationAndCapacityCount event={event} />
            </Card.Text>
            <div>
              {tags && tags.map((tag) =>
                <Badge key={tag.id} pill className="mr-1 bg--darken_1" style={{color: 'white'}}>{tag.name}</Badge>
              )}
            </div>
          </Card.Body>
        </Card>
      </>
    )
  }
}

EventCard.propTypes = propTypes