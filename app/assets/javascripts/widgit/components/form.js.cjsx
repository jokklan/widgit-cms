'use strict'

@Form = React.createClass
  getInitialState: ->
    { inputs: [] }

  componentDidMount: ->
    PubSub.subscribe 'component:onClick', (event, component) =>
      inputs = component.getInputs()

      data = {}
      inputs.map (input) =>
        data[input.attribute] = input.value

      @setState(component: component, inputs: inputs, data: data)

  startDialog: (event)->
    dialogType = event.target.getAttribute('data-dialog')

    @refs.dialog.open(dialogType)

  handleBlur: (event)->
    target = event.target
    data = {}
    data[target.name] = target.value

    @state.component.setState(data)

  handleChange: (event) ->
    target = event.target

    data = @state.data
    data[target.name] = target.value

    @setState(data: data)

  handleDialogComplete: (data)->
    @state.component.setState(data)

  render: ->
    inputs = @state.inputs.map (input) =>
      if input.dialog
        <div>
          <input type="button" name={input.attribute} data-dialog={input.dialog} onClick={this.startDialog} />
        </div>
      else if input.type
        <input name={input.attribute} value={@state.data[input.attribute]} type={input.type} onChange={this.handleChange} onBlur={this.handleBlur} />

    <div>
      {inputs}
      <Dialog ref="dialog" onConfirm={this.handleDialogComplete} />
    </div>
