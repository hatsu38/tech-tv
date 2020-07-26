import React, { Component } from 'react'
import PropTypes from 'prop-types';
import { Button, Card } from 'react-bootstrap';

import "../stylesheets/components/event_detail"

const propTypes = {
  description: PropTypes.string,
}

export default class EventDescription extends Component {
  constructor(props) {
    super(props)
    this.state = {
      isSlice: true
    }

    this.moreReadDescription = this.moreReadDescription.bind(this);
  }

  componentDidMount = () => {
    if(this.props.description.length < 300) {
      this.setState({isSlice: false})
    }
  }

  displayEventDescription() {
    const description = this.props.description
    if(this.state.isSlice && description.length > 300){
      return description.slice(0, 300)
    }
    return description
  }

  moreReadDescription() {
    this.setState({isSlice: false})
  }

  render() {
    const description = this.displayEventDescription()
    const isSlice = this.state.isSlice

    return (
      <>
        <div className="position-relative">
          <Card.Body dangerouslySetInnerHTML={{__html: description}} className="event--description"/>
            {isSlice && <div className="more-none" /> }
        </div>
        {isSlice &&
          <Button
            variant="outline-primary"
            className="moreReadButton--wrapper"
            onClick={this.moreReadDescription}
          >
            もっと見る
          </Button>
        }
      </>
    )
  }
}

EventDescription.propTypes = propTypes