import React from "react"
import PropTypes from 'prop-types'
import PageTransitionButton from '../components/PageTransitionButton'
import MoreReadButton from '../components/MoreReadButton'

const propTypes = {
  hasInfiniteScroll: PropTypes.bool.isRequired,
  isLoading:  PropTypes.bool.isRequired,
  hasMore:  PropTypes.bool.isRequired,
  link:  PropTypes.string.isRequired,
  fetch:  PropTypes.func.isRequired,
}

export default class MoreReadOrPageTransitionButton extends React.Component {
  constructor(props) {
    super(props);
  }

  fetch = () => {
    this.props.fetch()
  }

  render() {
    const { isLoading, link, hasMore, hasInfiniteScroll } = this.props
    return (
      hasInfiniteScroll ? <MoreReadButton isLoading={isLoading} hasMore={hasMore} fetch={this.fetch} />
      : <PageTransitionButton link={link} />
    )
  }
}

MoreReadOrPageTransitionButton.propTypes = propTypes