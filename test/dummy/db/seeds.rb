page = Widgit::Page.create!(title: 'Test')
widget_group = page.widget_groups.create!
widget_group.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text")
