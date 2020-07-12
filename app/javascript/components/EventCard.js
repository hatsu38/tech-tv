import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card, Badge } from 'react-bootstrap';
import { BrowserRouter as Router, Link, Switch, Route } from 'react-router-dom';

import HoldingDateTime from '../components/HoldingDateTime'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'

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
      <Router>
        <Card className="border-top-none">
          <Card.Body>
            <Card.Title onClick={this.toEventDetailPage}>{event.title}</Card.Title>
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
      </Router>
    )
  }
}

EventCard.propTypes = propTypes