'use strict'

@Block = React.createClass
  render: ->
    columns = this.props.data.columns.map (column)->
      <Column key={column.id} data={column} />

    <div className="row block background-color-{this.props.data.background_color}">
      <div className="container">
        <div className="row">
          {columns}
        </div>
      </div>
    </div>

@Column = React.createClass
  render: ->
    classString = "col-sm-#{this.props.data.columns}"

    <div className={classString}>
      <Tile key={this.props.data.tile.id} data={this.props.data.tile}/>
    </div>

@Tile = React.createClass
  render: ->
    components = this.props.data.components.map (component)=>
      React.createElement(window[component.type], { initialData: component, key: component.id })

    <div className="tile">
      {components}
    </div>
