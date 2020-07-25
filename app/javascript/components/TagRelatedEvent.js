import React, { Component } from 'react'
import PropTypes from 'prop-types'
import MiniImageEvents from '../components/MiniImageEvents'

const propTypes = {
  tag: PropTypes.object.isRequired
}

export default class TagRelatedEvent extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const tag = this.props.tag
    const events = this.props.tag.events
    return (
      <>
        <div className="border-top white--background ">
          <div className="mb-5 pt-20 pb-20 pl-20 pr-20 border-bottom display-flex">
            <h2 className="f4 section-title-main-text marginless">
              <a href={'/tags/' + tag.id} className="gray--800">#{tag.name}</a>
            </h2>
            <p className="link--text marginless">
              <a href={'/tags/' + tag.id}>
                もっと見る
              </a>
            </p>
          </div>
            {events && <MiniImageEvents events={events} />}
        </div>
      </>
    )
  }
}

TagRelatedEvent.propTypes = propTypes