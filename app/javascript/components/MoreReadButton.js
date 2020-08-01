import React from "react"
import PropTypes from 'prop-types'
import { Button } from "react-bootstrap"

const propTypes = {
  isLoading:  PropTypes.bool.isRequired,
  hasMore:  PropTypes.bool.isRequired,
  fetch:  PropTypes.func.isRequired,
}

export default class MoreRead extends React.Component {
  constructor(props) {
    super(props);
  }

  fetch = () => {
    this.props.fetch()
  }

  render() {
    const { isLoading, hasMore, fetch } = this.props
    return(
      <>
        {hasMore && (
          <div className="moreReadButton--wrapper mb-40">
            <Button
              block
              variant="outline-secondary"
              className="padding-sm"
              disabled={isLoading}
              onClick={isLoading ? null : this.fetch}
            >
              {isLoading ? '読み込み中…' : 'もっと見る'}
            </Button>
          </div>
        )}
      </>
    )
  }
}

MoreRead.propTypes = propTypes