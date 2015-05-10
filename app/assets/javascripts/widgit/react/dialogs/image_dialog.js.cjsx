@ImageDialog = React.createClass
  getInitialState: ->
    { data: [] }

  componentDidMount: ->
    $.ajax
      url: '/admin/images',
      dataType: 'json',
      success: (data) =>
        @setState(data: data)

  handleImageClick: (data)->
    @props.onSelect(image: data, image_id: data.id)

  render: ->
    images = @state.data.map (image, index)=>
      <span>
        <div className="col-xs-12 col-sm-6 col-md-3">
          <Image onImageClick={this.handleImageClick} data={image}/>
        </div>
        <div className="clearfix visible-xs-block"></div>
      </span>

    <div className="row">
      {images}
    </div>

Image = React.createClass
  handleClick: ->
    @props.onImageClick(@props.data)

  render: ->
    <img className="img-responsive img-thumbnail" src={this.props.data.url} onClick={this.handleClick} />
