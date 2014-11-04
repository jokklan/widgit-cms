ActiveRecord::Base.transaction do
  page = Widgit::Page.create!(title: 'Test')
  widget_group = page.widget_groups.create!
  widget_group.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 12)

  widget_group = page.widget_groups.create!
  widget_group.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 6)
  widget_group.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 6)

  widget_group = page.widget_groups.create!
  widget_group.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 4)
  widget_group.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 6)
end
