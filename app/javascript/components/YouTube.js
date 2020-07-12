import React, { Component } from 'react'
import PropTypes from 'prop-types'

const propTypes = {
  movies: PropTypes.array
};

export default class YouTube extends Component {
  constructor(props) {
    super(props);
  }

  isNotEmpty(obj) {
    return Object.keys(obj).length
  }

  getYoutubeId(youtubeUrl) {
    return youtubeUrl.replace(/http.:\/\/youtu.be\//, '')
  }

  formatEmbedYoutubeURL(youtubeLiveUrl) {
    const youtubeId = this.getYoutubeId(youtubeLiveUrl)
    return `https://www.youtube.com/embed/${youtubeId}`
  }

  render() {
    const { movies } = this.props
    return (
      <>
        <div>
          {movies && movies.map(movie =>
            <div key={movie.id} className="frame-wrapper__video">
              <iframe width="640" height="360" src={this.formatEmbedYoutubeURL(movie.url)} />
            </div>
          )}
        </div>
      </>
    )
  }
}


YouTube.propTypes = propTypes