'use strict'

@Block = React.createClass
  handleUpdate: (data) ->
    newState = {}
    newState[@state.id] = { id: @state.id, columns_attributes: data }
    @props.onUpdate(newState)

  getInitialState: ->
    @props.initialData

  render: ->
    columns = Object.keys(@state.columns_attributes).map (id)=>
      column = @state.columns_attributes[id]
      <Column key={column.id} initialData={column} onUpdate={@handleUpdate}/>

    <div className="row block background-color-{@state.background_color}">
      <div className="container">
        <div className="row">
          {columns}
        </div>
      </div>
    </div>

@Column = React.createClass
  handleUpdate: (data)->
    newState = {}
    newState[@state.id] = { id: @state.id, tile_attributes: data }
    @props.onUpdate(newState)

  getInitialState: ->
    @props.initialData

  render: ->
    classString = "col-sm-#{@state.columns}"

    <div className={classString}>
      <Tile key={@state.tile_attributes.id} initialData={@state.tile_attributes} onUpdate={@handleUpdate}/>
    </div>

@Tile = React.createClass
  handleUpdate: (data)->
    @props.onUpdate({ id: @state.id, components_attributes: data })

  getInitialState: ->
    @props.initialData

  render: ->
    components = Object.keys(@state.components_attributes).map (id)=>
      component = @state.components_attributes[id]
      React.createElement(window[component.type], { initialData: component, key: component.id, onUpdate: @handleUpdate })

    <div className="tile">
      {components}
    </div>
