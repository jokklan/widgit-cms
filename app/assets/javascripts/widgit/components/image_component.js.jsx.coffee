'use strict'

Image = React.createClass
  handleClick: ->
    alert("CLICK")

  render: ->
    imageTag = `<img alt={this.props.data.name} className="img-responsive" src={this.props.data.url} onClick={this.handleClick}/>`

    if this.props.link_url
      content = `<a href={this.props.data.link_url} target="_blank">{imageTag}</a>`
    else
      content = imageTag

    `<div className="component">
      {content}
    </div>`

window.Image = Image
