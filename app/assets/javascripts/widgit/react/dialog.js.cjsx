@Dialog = React.createClass
  getInitialState: ->
    { type: null }

  componentDidMount: ->
    @jQueryElement().modal(backdrop: 'static', keyboard: false, show: false)

  jQueryElement: ->
    $(@getDOMNode())

  close: ->
    @jQueryElement().modal('hide')

  open: (type)->
    @setState(type: type)
    @jQueryElement().modal('show')

  handleCancel: ->
    if @props.onCancel
      @props.onCancel()

    @close()

  handleConfirm: (data)->
    if @props.onConfirm
      @props.onConfirm(data)

    @close()

  handleSelect: (data)->
    @handleConfirm(data)

  render: ->
    if @state.type == 'image'
      content = <ImageDialog onSelect={this.handleSelect} />
    else if @state.type == 'icon'
      content = <IconDialog onSelect={this.handleSelect} />

    <div className="modal fade">
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <button
              type="button"
              className="close"
              onClick={this.handleCancel}>
              &times;
            </button>
            <h3>{this.props.title}</h3>
          </div>
          <div className="modal-body">
            {content}
          </div>
          <div className="modal-footer">
            <a className="btn-default btn"  href="javascript:;" role="button" onClick={this.handleCancel}>Cancel</a>
            <a className="btn-primary btn"  href="javascript:;" role="button" onClick={this.handleConfirm}>Confirm</a>
          </div>
        </div>
      </div>
    </div>
