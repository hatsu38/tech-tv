import React, { Component } from 'react'
import axios from 'axios'
import PropTypes from 'prop-types'
import EventCards from '../components/EventCards'
import PageTitle from '../components/PageTitle'
import MoreReadButton from '../components/MoreReadButton'
import { Button } from "react-bootstrap"

const REQUEST_API_BASE_URL = "/api/v1/tags/"

const propTypes = {
  tag: PropTypes.object.isRequired,
}

export default class TagDetail extends Component {
  constructor(props) {
    super(props);
    this.state = {
      page: 2,
      events: []
    }
  }

  componentDidMount() {
    this.setState({ events: this.props.events})
  }

  fetchTags = async () => {
    const { tag } = this.props
    const { page } = this.state

    const api = `${REQUEST_API_BASE_URL}/${tag.id}?page=${page}per=8`
    const apiResponse = await axios.get(api).catch(null)
    if(!apiResponse || !apiResponse.data || apiResponse.data.status === 500) { return true }

    const data = apiResponse.data
    const insertEvents = this.state.events.concat(data.events)
    this.setState({events: insertEvents, page: page + 1})
  }

  render() {
    const {tag, totalCount} = this.props
    const { events } = this.state
    console.log(tag)
    return (
      <div className="white--background border-top">
        <PageTitle eventCount={totalCount} title={tag.name} />
        {events && <EventCards events={events} />}
        {events.length < totalCount &&
          <div className="moreReadButton--wrapper mb-40">
            <Button
              block
              variant="outline-secondary"
              className="padding-sm"
              onClick={this.fetchTags}
            >
              もっと見る
            </Button>
          </div>
        }
      </div>
    )
  }
}

TagDetail.propTypes = propTypes
