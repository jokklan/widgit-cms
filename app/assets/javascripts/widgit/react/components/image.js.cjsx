'use strict'

@Image = React.createClass
  name: 'Image'

  handleUpdate: (data)->
    @setState(data)
    newState = {}
    newState[@state.id] = { id: @state.id, image_id: data.image_id } #$.extend({}, @state, data)
    @props.onUpdate(newState)

  getInitialState: ->
    this.props.initialData

  handleClick: ->
    PubSub.publish 'component:onClick', this

  getInputs: ->
    [
      { attribute: 'link_url', type: 'text', value: @state.link_url },
      { attribute: 'image', dialog: 'image', value: @state.image }
    ]

  render: ->
    imageTag = <img alt={this.state.image.name} className="img-responsive" src={this.state.image.url} onClick={this.handleClick} />

    if @state.link_url
      content = <div href={this.state.link_url} target="_blank">{imageTag}</div>
    else
      content = imageTag

    <div className="component">
      {content}
    </div>
