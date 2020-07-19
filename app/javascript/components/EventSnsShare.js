import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { faCopy } from '@fortawesome/free-solid-svg-icons'; //fontawesomeのsolidアイコンのインポート //fontawesomeのregularアイコンのインポート
import { CopyToClipboard } from 'react-copy-to-clipboard';
import { FacebookShareButton, FacebookIcon, TwitterShareButton, TwitterIcon } from 'react-share';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

const propTypes = {
  event: PropTypes.object.isRequired
}

export default class EventSnsShare extends Component {
  constructor(props) {
    super(props)
    this.state = {
      copied: false
    }
  }

  copyClick = () => {
    this.setState({copied: true})
    setTimeout(
      () => this.setState({copied: false}),
      2000
    );
  }

  render() {
    const { event } = this.props
    const shareURL = location.href.replace(location.search, "")
    const shareTitle = event.title + " | こんぱすちゅ〜ぶ" + "\n\n"
    return (
      <>
        <div className="display-float text-center mt-25">
          <h5 className="f6 marginless" style={{color: "gray"}}>このイベントをシェアする</h5>
          <TwitterShareButton　className="margin-sm" title={shareTitle} url={shareURL} >
            <TwitterIcon size={32} round />
          </TwitterShareButton>
          <FacebookShareButton className="margin-sm" url={shareURL} quote={shareTitle}>
            <FacebookIcon size={32} round />
          </FacebookShareButton>
          <CopyToClipboard text={shareURL} onCopy={this.copyClick}>
            <div className="link-copy-button--wrapper margin-sm">
              <FontAwesomeIcon icon={faCopy} className="" />
            </div>
          </CopyToClipboard>
          {this.state.copied ? <span style={{color: 'red', fontWeight: 'bold'}}>URLをコピーしました</span> : null}
        </div>
      </>
    )
  }
}

EventSnsShare.propTypes = propTypes