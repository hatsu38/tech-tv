import React, { Component } from 'react'
import PropTypes from 'prop-types';

import HoldingDateTime from '../components/HoldingDateTime'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCalendarAlt } from '@fortawesome/free-solid-svg-icons'
import moment from 'moment';
moment.locale("ja");

const propTypes = {
  startDateTime: PropTypes.string.isRequired,
  endDateTime: PropTypes.string.isRequired,
};

export default class HoldingDateTimeWithIcon extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {startDateTime, endDateTime} = this.props
    return (
      <>
        <FontAwesomeIcon icon={faCalendarAlt} className="icon--margin gray--700" />
        <HoldingDateTime
          startDateTime={startDateTime}
          endDateTime={endDateTime}
        />
      </>
    )
  }
}

HoldingDateTimeWithIcon.propTypes = propTypes
