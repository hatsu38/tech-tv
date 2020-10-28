import React from "react"
import EventCards from '../components/EventCards'
import PageTitle from '../components/PageTitle'
import MoreReadButton from '../components/MoreReadButton'
import { Container } from "react-bootstrap"
import axios from 'axios'
const REQUEST_API_BASE_URL = "/api/v1/events/"

import "../stylesheets/components/popular_events"

export default class PopularEvents extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.initialState
    // this.fetchEvents = this.fetchEvents.bind(this)
    this.handleSelect = this.handleSelect.bind(this)
  }

  get initialState() {
    return {
      events: [],
      range: 'recent',
      totalEventsCount: 0,
      page: 1,
      hasMore: false,
      isLoading: false
    }
  }

  // componentDidMount = () => {
  //   this.fetchEvents()
  // }

  // componentDidUpdate(prevProps, prevState) {
  //   if (!this.props.events) {
  //     this.fetchEvents()
  //   }
  // }

  resetState = () => {
    this.setState(this.initialState)
  }

  resetStateExceptRange = () => {
    this.setState({events: []})
    this.setState({page: 1})
    this.setState({hasMore: false})
    this.setState({isLoading: false})
  }

  handleSelect = eventKey =>  {
    this.resetStateExceptRange()
    this.setState({range: eventKey})
  }

  async fetchEvents() {
    this.setState({isLoading: true})
    const { events, page, range } = this.state
    const api = `${REQUEST_API_BASE_URL}?range=${range}&page=${page}&per=8`
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
    const { events, totalEventsCount } = this.props
    return (
      <React.Fragment>
        <Container>
          <PageTitle title="人気の勉強会イベント動画" eventCount={totalEventsCount} />
          {events && <EventCards events={events} />}
        </Container>
      </React.Fragment>
    );
  }
}
