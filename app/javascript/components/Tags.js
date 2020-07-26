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

  render() {
    const tags = this.props.tags
    return (
      <div>
        {tags && tags.map((tag) =>
          <Badge key={tag.id} pill className="mr-1 base_bg_color tag-padding">
            <a href={'/tags/' + tag.id} className="white-text">
              {tag.name}
            </a>
          </Badge>
        )}
      </div>
    )
  }
}

Tags.propTypes = propTypes