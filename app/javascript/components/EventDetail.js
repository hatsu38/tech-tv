import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faExternalLinkAlt } from '@fortawesome/free-solid-svg-icons'

import HoldingDateTime from '../components/HoldingDateTime'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'

const propTypes = {
  event: PropTypes.object.isRequired,
}

export default class EventDetail extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    const event = this.props.event

    return (
      <>
        <Card>
          <Card.Body>
            <Card.Text>
              {event.title}
            </Card.Text>
            <Card.Text className="text--light">
              <HoldingDateTime
                startDateTime={event.started_at}
                endDateTime={event.ended_at}
              />
            </Card.Text>
            <Card.Text className="text--light">
              <ApplicationAndCapacityCount event={event} />
            </Card.Text>
            <Card.Text className="text--light">
              <a href={event.connpass_event_url} target="_blank">
                <FontAwesomeIcon icon={faExternalLinkAlt} className="icon--margin darken_1" />
              </a>
              <a href={event.connpass_event_url} target="_blank">
                元のイベントページへ
              </a>
            </Card.Text>
          </Card.Body>
        </Card>
      </>
    )
  }
}

EventDetail.propTypes = propTypes