@Page = React.createClass
  getInitialState: ->
    { data: [] }

  componentDidMount: ->

  handleBlockSubmit: (block)->
    blocks = @state.data;
    newBlocks = comments.concat([block]);
    @setState({ data: newBlocks });

  handlePageChange: (block)->
    window.currentTarget.setState(data: block)
    console.log('handlePageChange')

  render: ->
    blocks = this.props.data.map (block)->
      <Block key={block.id} data={block} />

    <div id="page">
      <SidePanel onPageChange={this.handlePageChange} />
      {blocks}
    </div>

