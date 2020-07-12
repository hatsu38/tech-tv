import React, { Component } from 'react'
import axios from 'axios'
import PropTypes from 'prop-types';
import TagRelatedEvents from '../components/TagRelatedEvents'
const REQUEST_API_BASE_URL = "/api/v1/events/"

const propTypes = {
  event: PropTypes.object.isRequired
}


export default class EventDetailTagRelatedEvents extends Component {
  constructor(props) {
    super(props)
    this.state = {
      tags: []
    }
  }

  componentDidMount = () => {
    this.fetchTagsRelatedEvent()
  }

  async fetchTagsRelatedEvent() {
    const api = `${REQUEST_API_BASE_URL}/${this.props.event.id}`
    const apiResponse = await axios.get(api).catch(null)
    if(!apiResponse || !apiResponse.data || apiResponse.data.status === 500) { return true }

    const data = apiResponse.data
    const insertTags = this.state.tags.concat(data.tags)
    this.setState({tags: insertTags})
  }

  render() {
    const { tags } = this.state
    return (
      <>
        {tags && <TagRelatedEvents tags={tags} />}
      </>
    )
  }
}

EventDetailTagRelatedEvents.propTypes = propTypes