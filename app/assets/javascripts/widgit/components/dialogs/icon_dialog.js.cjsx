@IconDialog = React.createClass
  getInitialState: ->
    { data: ['camera', 'cutlery', 'phone', 'rocket', 'plug', 'smile-o', 'taxi', 'star', 'soccer-ball-o'] }

  handleIconClick: (data)->
    @props.onSelect(icon: data)

  render: ->
    icons = @state.data.map (icon, index)=>
      <Icon onIconClick={this.handleIconClick} icon={icon}/>

    <div className="row">
      {icons}
    </div>

Icon = React.createClass
  handleClick: ->
    @props.onIconClick(@props.icon)

  render: ->
    iconClass = "icon-list-item fa fa-#{@props.icon}"

    <div className={iconClass} onClick={this.handleClick} />
