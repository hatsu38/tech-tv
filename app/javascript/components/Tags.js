import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Badge } from 'react-bootstrap';
import '../stylesheets/components/tag'

const propTypes = {
  tags: PropTypes.array
}

export default class Tags extends Component {
  constructor(props) {
    super(props);
  }

  toTagDetailPage(tagId) {
    window.location = `/tags/${tagId}`
  }

  render() {
    const tags = this.props.tags
    return (
      <div>
        {tags && tags.map((tag) =>
          <Badge
            key={tag.id}
            pill
            className="mr-1 bg-gray--600 white-text tag-padding"
            onClick={this.toTagDetailPage.bind(this, tag.id)}
          >{tag.name}</Badge>
        )}
      </div>
    )
  }
}

Tags.propTypes = propTypes