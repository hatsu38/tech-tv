import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Media } from 'react-bootstrap';

import HoldingDateTime from '../components/HoldingDateTime'
import ApplicationAndCapacityCount from '../components/ApplicationAndCapacityCount'
import Tags from '../components/Tags'

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
          <Media as="li" key={`${event.id}/${index}`} className="pt-15 pb-15 pr-5 pl-5 border-bottom">
            <img
              width={64}
              height={64}
              className="mr-3"
              src={event.movies[0]}
              alt="Generic placeholder"
            />
            <Media.Body>
              <h5>
                <a href={'/events/' + event.id} className="gray--800">{event.title}</a>
              </h5>
              <div className="text--light">
                <HoldingDateTime
                  startDateTime={event.started_at}
                  endDateTime={event.ended_at}
                />
              </div>
              <div className="text--light">
                <ApplicationAndCapacityCount event={event} />
              </div>
              {event.tags && <Tags tags={event.tags} />}
            </Media.Body>
          </Media>
        ))}
      </ul>
    )
  }
}

MiniImageEvents.propTypes = propTypes