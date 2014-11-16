ActiveRecord::Base.transaction do
  page = Widgit::Page.create!(title: 'Test')
  block = page.blocks.create!
  block.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 12)

  block = page.blocks.create!
  block.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 6)
  block.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 6)

  block = page.blocks.create!
  block.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 4)
  block.widgets.create!(type: "Widgit::Widgets::Text", text: "Some text", columns: 6)
end
