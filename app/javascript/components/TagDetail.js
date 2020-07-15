import React, { Component } from 'react'
import PropTypes from 'prop-types'
import EventCards from '../components/EventCards'
import PageTitle from '../components/PageTitle'

const propTypes = {
  tag: PropTypes.object.isRequired,
  events: PropTypes.array.isRequired,
  totalCount: PropTypes.number.isRequired,
}

export default class TagRelatedEvent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {tag, events, totalCount} = this.props
    return (
      <>
        <div className="white--background border-top">
          <PageTitle eventCount={totalCount} title={tag.name} />
          <hr className="marginless" />
          {events && <EventCards events={events} />}
        </div>
      </>
    )
  }
}

TagRelatedEvent.propTypes = propTypes