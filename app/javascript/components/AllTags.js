import React from "react"
import PageTitle from '../components/PageTitle'
import Hr from '../components/Hr'
import { Button, ListGroup } from "react-bootstrap"
import axios from 'axios'
const REQUEST_API_BASE_URL = "/api/v1/tags"

export default class AllTags extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.initialState
    this.fetchTags = this.fetchTags.bind(this)
  }

  get initialState() {
    return {
      tags: [],
      totalTagsCount: 0,
      page: 1,
      hasMore: false,
      isLoading: false
    }
  }

  componentDidMount = () => {
    this.fetchTags()
  }

  async fetchTags() {
    console.log("fetchTags")
    this.setState({isLoading: true})
    const { tags, page } = this.state
    const api = `${REQUEST_API_BASE_URL}?&page=${page}&per=25`
    const apiResponse = await axios.get(api).catch(null)

    if(!apiResponse || !apiResponse.data || apiResponse.data.status === 500) {
      this.setState({hasMore: false})
      this.setState({isLoading: false})
      return true
    }

    const data = apiResponse.data
    console.log("data", data)
    const insertTags = tags.concat(data.tags)

    this.setState({tags: insertTags})
    this.setState({totalTagsCount: data.total_count})

    this.updatePageAndHasMore()
    this.setState({isLoading: false})
  }

  updatePageAndHasMore = () => {
    const { tags, totalTagsCount, page } = this.state
    if(totalTagsCount > tags.length){
      const nextPage = page + 1
      this.setState({hasMore: true})
      this.setState({page: nextPage})
    } else {
      this.setState({hasMore: false})
    }
  }

  render() {
    const { tags, isLoading, hasMore, totalTagsCount } = this.state
    if(tags.length < 1){ return false }

    const moreReadButton = (
      <div className="moreReadButton--wrapper mb-40">
        <Button
          block
          variant="outline-secondary"
          className="padding-sm"
          disabled={isLoading}
          onClick={isLoading ? null : this.fetchTags}
        >
          {isLoading ? '読み込み中…' : 'もっと見る'}
        </Button>
      </div>
    )
    return (
      <>
        <PageTitle title="タグ一覧" link="/tags" />
        <Hr />
        {tags && (
          <ListGroup>
            {tags.map(tag => (
              <ListGroup.Item action href={'/tags/' + tag.id} key={tag.id}>
                {tag.name}　<span className="small">({tag.event_count}件)</span>
              </ListGroup.Item>
            ))}
          </ListGroup>
        )}
        {hasMore && moreReadButton}
      </>
    )
  }
}
