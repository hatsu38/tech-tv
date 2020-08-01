import React from "react"
import PropTypes from 'prop-types'
import { Button } from "react-bootstrap"

const propTypes = {
  link:  PropTypes.string.isRequired
}

export default class PageTransitionButton extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { link } = this.props
    return(
      <div className="moreReadButton--wrapper mb-40">
        <Button
          block
          variant="outline-secondary"
          className="padding-sm"
          href={link}
        >
          もっと見る
        </Button>
      </div>
    )
  }
}

PageTransitionButton.propTypes = propTypes