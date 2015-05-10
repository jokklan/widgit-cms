@Toolbar = React.createClass
  toggleToolbar: ->
    $('body').toggleClass 'built-mode'

  render: ->
    <div className="toolbar-bottom text-center">
      <button className="toolbar-toggle" onClick={@toggleToolbar}>
        <i className="fa fa-wrench" />
      </button>

      <ul className="list-inline">
        <li className="component-toolbar">
          <button className="btn btn-default btn-drag-boxes">
            <i className="fa fa-flag" />
          </button>
        </li>

        <li className="component-toolbar">
          <button className="btn btn-default btn-drag-boxes">
            <i className="fa fa-image" />
          </button>
        </li>

        <li className="component-toolbar">
          <button className="btn btn-default btn-drag-boxes">
            <i className="fa fa-paragraph" />
          </button>
        </li>

        <li className="toolbar-divider">
          <button className="btn btn-default btn-drag-boxes">
            <i className="fa fa-arrows" />
          </button>
        </li>

        <li className="toolbar-divider">
          <button className="btn btn-success">
            <i className="fa fa-floppy-o" />
          </button>
        </li>
      </ul>
    </div>
