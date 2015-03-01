'use strict'

Block = React.createClass
  handleClick: ->
    alert("CLICK")

  render: ->
    columns = this.props.columns.map (column)->
      `<Column data={column} />`

    `<div className="row block background-color-{this.props.background_color}">
      <div className="container">
        <div className="row">
          {columns}
        </div>
      </div>
    </div>`

Column = React.createClass
  render: ->
    classString = "col-sm-#{this.props.data.columns}"

    `<div className={classString}>
      <Tile data={this.props.data.tile}/>
    </div>`

Tile = React.createClass
  render: ->
    components = this.props.data.components.map (component)->
      React.createElement(window[component.type], { data: component })

    `<div className="tile">
      {components}
    </div>`

window.Block = Block
