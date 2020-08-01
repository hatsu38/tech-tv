import React from "react"
import PropTypes from 'prop-types'
import MiniImageEvents from '../components/MiniImageEvents'
import PageTitle from '../components/PageTitle'
import Hr from '../components/Hr'
import MoreReadOrPageTransitionButton from '../components/MoreReadOrPageTransitionButton'
import { Button } from "react-bootstrap"
import axios from 'axios'
const REQUEST_API_BASE_URL = "/api/v1/newly_events"

const propTypes = {
  hasInfiniteScroll: PropTypes.bool.isRequired,
}

export default class NewlyEvents extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.initialState
    this.fetchEvents = this.fetchEvents.bind(this)
  }

  get initialState() {
    return {
      events: [],
      totalEventsCount: 0,
      page: 1,
      hasMore: false,
      isLoading: false
    }
  }

  componentDidMount = () => {
    this.fetchEvents()
  }

  async fetchEvents() {
    this.setState({isLoading: true})
    const { events, page } = this.state
    const api = `${REQUEST_API_BASE_URL}?&page=${page}&per=5`
    const apiResponse = await axios.get(api).catch(null)

    if(!apiResponse || !apiResponse.data || apiResponse.data.status === 500) {
      this.setState({hasMore: false})
      this.setState({isLoading: false})
      return true
    }

    const eventData = apiResponse.data
    const insertEvents = events.concat(eventData.events)

    this.setState({events: insertEvents})
    this.setState({totalEventsCount: eventData.total_count})

    this.updatePageAndHasMore()
    this.setState({isLoading: false})
  }

  updatePageAndHasMore = () => {
    const { events, totalEventsCount, page } = this.state
    if(totalEventsCount > events.length){
      const nextPage = page + 1
      this.setState({hasMore: true})
      this.setState({page: nextPage})
    } else {
      this.setState({hasMore: false})
    }
  }

  render() {
    const { events, isLoading, hasMore, totalEventsCount } = this.state
    const { hasInfiniteScroll } = this.props
    if(events.length < 1){ return false }

    return (
      <>
        <PageTitle eventCount={totalEventsCount} title="新着イベント" link="/newly_events" />
        <Hr />
        {events && <MiniImageEvents events={events} />}
        <MoreReadOrPageTransitionButton
          isLoading={isLoading}
          link="/newly_events"
          fetch={this.fetchEvents}
          hasInfiniteScroll={hasInfiniteScroll}
          hasMore={hasMore}
        />
      </>
    )
  }
}

NewlyEvents.propTypes = propTypes