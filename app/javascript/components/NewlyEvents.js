import React from "react"
import PropTypes from 'prop-types'
import MiniImageEvents from '../components/MiniImageEvents'
import PageTitle from '../components/PageTitle'
import Hr from '../components/Hr'
import PageTransitionButton from '../components/PageTransitionButton'
import { Button } from "react-bootstrap"
import axios from 'axios'
const REQUEST_API_BASE_URL = "/api/v1/newly_events"

const propTypes = {
  moreRead: PropTypes.bool.isRequired,
}

export default class NewlyEvents extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.initialState
    this.fetchEvents = this.fetchEvents.bind(this)
  }

  get initialState() {
    return {
      page: 2,
      events: []
    }
  }

  componentDidMount() {
    this.setState({ events: this.props.events})
  }

  async fetchEvents() {
    const { events, page } = this.state
    const api = `${REQUEST_API_BASE_URL}?&page=${page}`
    const apiResponse = await axios.get(api).catch(null)

    if(!apiResponse || !apiResponse.data || apiResponse.data.status === 500) { return true }

    const eventData = apiResponse.data
    const insertEvents = events.concat(eventData.events)

    this.setState({events: insertEvents, page: page + 1})
  }


  render() {
    const { moreRead, totalEventsCount } = this.props
    const { events } = this.state
    if(events.length < 1){ return false }

    return (
      <>
        <PageTitle eventCount={totalEventsCount} title="新着の勉強会イベント動画" link="/newly_events" />
        <Hr />
        {events && <MiniImageEvents events={events} />}
        {moreRead ?
          (events.length < totalEventsCount &&
            <div className="moreReadButton--wrapper mb-40">
              <Button
                block
                variant="outline-secondary"
                className="padding-sm"
                onClick={this.fetchEvents}
              >
                もっと見る
              </Button>
            </div>
          )
          : <PageTransitionButton link={"/newly_events"} />
        }
      </>
    )
  }
}

NewlyEvents.propTypes = propTypes