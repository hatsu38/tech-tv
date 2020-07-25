import React, { Component } from 'react'
import PropTypes from 'prop-types';
import TagRelatedEvent from '../components/TagRelatedEvent'

const propTypes = {
  tags: PropTypes.array
}

export default class TagRelatedEvents extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { tags } = this.props

    return (
      <>
        {tags &&
          tags.map(tag =>
            tag.events && <TagRelatedEvent key={tag.id} tag={tag} />
          )
        }
      </>
    )
  }
}

TagRelatedEvents.propTypes = propTypes