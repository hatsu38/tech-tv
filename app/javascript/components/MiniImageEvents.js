import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Media } from 'react-bootstrap';

import HoldingDateTimeWithIcon from '../components/HoldingDateTimeWithIcon'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'
import Tags from '../components/Tags'

import "../stylesheets/components/mini_image_events"

const propTypes = {
  events: PropTypes.array.isRequired,
}

export default class MiniImageEvents extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const events = this.props.events
    if(!events) { return null }

    return (
      <ul className="list-unstyled bg--white">
        {events.map((event, index) => (
          <div className="media--wrapper" key={`${event.id}-${index}`}>
            <Media as="li" className="pt-15 pb-15 pr-5 pl-5">
              <a href={'/events/' + event.id}>
                <img
                  className="mr-3 responsive--media"
                  src={event.movies[0]}
                  alt={event.title}
                />
              </a>
              <Media.Body>
                <h5 className="font-wight--600 event--title">
                  <a href={'/events/' + event.id} className="gray--800">{event.title}</a>
                </h5>
                <div className="text--light">
                  <HoldingDateTimeWithIcon
                    startDateTime={event.started_at}
                    endDateTime={event.ended_at}
                  />
                </div>
                <div className="text--light mb-5">
                  <ApplicationAndCapacityCount event={event} />
                </div>
                {event.tags && <Tags tags={event.tags} />}
              </Media.Body>
            </Media>
          </div>
        ))}
      </ul>
    )
  }
}

MiniImageEvents.propTypes = propTypes