@Page = React.createClass
  getInitialState: ->
    @props.initialData

  componentDidMount: ->
    PubSub.subscribe 'toolbar:save', (event) =>
      console.log('save page')
      console.log(@state.newData)

      $.ajax
        url: "/admin/pages/#{@state.id}",
        method: 'PATCH',
        dataType: 'json',
        data: { page: @state.newData }

  # handleBlockSubmit: (block)->
  #   blocks = @state.data;
  #   newBlocks = comments.concat([block]);
  #   @setState({ data: newBlocks });

  handleUpdate: (data) ->
    @setState(newData: { blocks_attributes: data })

  handlePageChange: (block)->
    window.currentTarget.setState(data: block)
    console.log('handlePageChange')

  render: ->
    blocks = Object.keys(@state.blocks_attributes).map (id)=>
      block = @state.blocks_attributes[id]
      <Block key={block.id} initialData={block} onUpdate={@handleUpdate} />

    <div id="page">
      <SidePanel onPageChange={@handlePageChange} />
      {blocks}
      <Toolbar />
    </div>

