import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Card, Badge } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faExternalLinkAlt } from '@fortawesome/free-solid-svg-icons'

import HoldingDateTimeWithIcon from '../components/HoldingDateTimeWithIcon'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'
import EventSnsShare from '../components/EventSnsShare'
import Tags from '../components/Tags'

const propTypes = {
  event: PropTypes.object,
  tags: PropTypes.array
}

export default class EventDetail extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    const {event, tags} = this.props

    return (
      <>
        <Card>
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
            {tags && <Tags tags={tags} />}
            <EventSnsShare event={event} />
          </Card.Body>
        </Card>
      </>
    )
  }
}

EventDetail.propTypes = propTypes