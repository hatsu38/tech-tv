import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card, Col } from 'react-bootstrap';

import HoldingDateTime from '../components/HoldingDateTime'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'
import Tags from '../components/Tags'

import '../stylesheets/components/event_card'

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
    const movies = event.movies
    const movie = movies ? movies[0] : ""
    if(!event) {return null}

    return (
      <Col xs={12} sm={6} md={4} lg={3} className="mb-10">
          <Card className="mr-5 ml-5 border-top-none h-100 shadow-card">
            { event.thumbnail_url &&
              <a href={'/events/' + event.id}><Card.Img variant="top" src={event.thumbnail_url} className="card--media" /></a>
            }
            <Card.Body className="">
              <Card.Text className="accent-text accent-datetime mb-5">
                <HoldingDateTime
                  startDateTime={event.started_at}
                  endDateTime={event.ended_at}
                />
              </Card.Text>
              <Card.Title className="gray--800 event-card-title three-point-reader--three">
                <a href={'/events/' + event.id} className="gray--800">{event.title}</a>
              </Card.Title>
              <Card.Text className="text--light mb-5">
                <ApplicationAndCapacityCount event={event} />
              </Card.Text>
              {tags && <Tags tags={tags} />}
            </Card.Body>
          </Card>
      </Col>
    )
  }
}

EventCard.propTypes = propTypes