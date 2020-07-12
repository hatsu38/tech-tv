import React from "react"
import PropTypes from "prop-types"
import { Nav, Card, Button } from "react-bootstrap"
const propTypes = {
  events: PropTypes.object.isRequired
}

export default class EventRanking extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.initialState
  }

  render () {
    const events = this.props.events
    return (
      <React.Fragment>
        Events: {events && events.map((event) => (
          <p>{event.title}</p>
        ))}
        <Button>Hoge</Button>
      </React.Fragment>
    );
  }
}

EventRanking.propTypes = propTypes

