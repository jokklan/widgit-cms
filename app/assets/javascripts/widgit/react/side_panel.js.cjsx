@SidePanel = React.createClass
  # getInitialState: ->
  #   { data: [] }

  # componentDidMount: ->
  #   PubSub.subscribe 'component:onClick', (event, component) =>
  #     @setState(component: component)

  # handleChange: (data)->
  #   @state.component.setState(data)

  render: ->
    <div id="panel" className="side-panel active">
      <div className="toggle">
        <i className="fa fa-caret-square-o-right"></i>
      </div>

      <div className="col-xs-12">
        <Form />
      </div>
    </div>

