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
    super(props);
  }

  render() {
    const shareURL = location.href.replace(location.search, "")
    const { event } = this.props
    return (
      <>
        <div className="display-float text-center mt-25">
          <h5 className="f6 marginless" style={{color: "gray"}}>このイベントをシェアする</h5>
          <TwitterShareButton　className="margin-sm" title={event.title + "\n\n"} url={shareURL} >
            <TwitterIcon size={32} round />
          </TwitterShareButton>
          <FacebookShareButton className="margin-sm" url={shareURL} quote={event.title}>
            <FacebookIcon size={32} round />
          </FacebookShareButton>
          <CopyToClipboard text={shareURL}>
            <div className="link-copy-button--wrapper margin-sm">
              <FontAwesomeIcon icon={faCopy} className="" />
            </div>
          </CopyToClipboard>
        </div>
      </>
    )
  }
}

EventSnsShare.propTypes = propTypes