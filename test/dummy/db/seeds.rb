ActiveRecord::Base.transaction do
  page = Widgit::Page.create!(title: 'Test')
  block = page.blocks.create!
  block.components.create!(type: "Widgit::Components::Text", text: "Some text", columns: 12)

  block = page.blocks.create!
  block.components.create!(type: "Widgit::Components::Text", text: "Some text", columns: 6)
  block.components.create!(type: "Widgit::Components::Text", text: "Some text", columns: 6)

  block = page.blocks.create!
  block.components.create!(type: "Widgit::Components::Text", text: "Some text", columns: 4)
  block.components.create!(type: "Widgit::Components::Text", text: "Some text", columns: 6)
end
