'use strict'

@Icon = React.createClass
  name: 'Icon'

  # componentDidUpdate: (previousProps, previousState)->
  #   @props.onUpdate(@state)

  handleUpdate: (data)->
    @props.onUpdate(data)

  getInitialState: ->
    this.props.initialData

  handleClick: ->
    PubSub.publish 'component:onClick', this

  getInputs: ->
    [
      { attribute: 'icon', dialog: 'icon', value: @state.icon }
    ]

  render: ->
    iconClass = "fa fa-#{@state.icon}"

    <div className="component">
      <div className={iconClass} onClick={@handleClick}></div>
    </div>
