import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card, Row, Col } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faExternalLinkAlt } from '@fortawesome/free-solid-svg-icons'

import HoldingDateTimeWithIcon from '../components/HoldingDateTimeWithIcon'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'
import EventSnsShare from '../components/EventSnsShare'
import Tags from '../components/Tags'
import YouTube from '../components/YouTube'

import "../stylesheets/components/event_detail"

const propTypes = {
  event: PropTypes.object,
  tags: PropTypes.array,
  movies: PropTypes.array,
  thumbnail: PropTypes.string,
}

export default class EventDetail extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    const {event, tags, movies, thumbnail} = this.props
    console.log("thumbnail", thumbnail)
    return (
      <>
        <div className="bg-color position-absolute" style={{backgroundImage: `url(${thumbnail}`}}></div>
        <Row noGutters className="event-info-wrapper">
          <Col className="movies" xs={12} md={8}>
            <YouTube movies={movies} />
          </Col>
          <Col xs={12} md={4}>
            <Card className="h-100">
              <Card.Body>
                <Card.Text>
                  {event.title}
                </Card.Text>
                <Card.Text className="text--light mb-5">
                  <HoldingDateTimeWithIcon
                    startDateTime={event.started_at}
                    endDateTime={event.ended_at}
                  />
                </Card.Text>
                <Card.Text className="text--light mb-5">
                  <ApplicationAndCapacityCount event={event} />
                </Card.Text>
                <Card.Text className="text--light mb-5">
                  <a href={event.connpass_event_url} target="_blank">
                    <FontAwesomeIcon icon={faExternalLinkAlt} className="icon--margin base_color" />
                  </a>
                  <a href={event.connpass_event_url} target="_blank">
                    元のイベントページへ
                  </a>
                </Card.Text>
              </Card.Body>
            </Card>
          </Col>
        </Row>
        <Card>
          <Card.Body dangerouslySetInnerHTML={{__html: event.description}} className="event--description"/>
          <Card.Body className="event--description">
            <h1>Tags</h1>
            <div>{tags && <Tags tags={tags} />}</div>
            <EventSnsShare event={event} />
          </Card.Body>
        </Card>
      </>
    )
  }
}

EventDetail.propTypes = propTypes