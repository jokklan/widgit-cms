ActiveRecord::Base.transaction do
  page = Widgit::Page.create!(title: 'Test')

  block = page.blocks.create!
  column = block.columns.create(columns: 12)
  tile = column.create_tile!
  tile.components.create!(type: "Widgit::Components::Text", text: "Some text")

  block = page.blocks.create!
  column = block.columns.create(columns: 6)
  tile = column.create_tile!
  tile.components.create!(type: "Widgit::Components::Text", text: "Some text")

  column = block.columns.create(columns: 6)
  tile = column.create_tile!
  tile.components.create!(type: "Widgit::Components::Text", text: "Some text")

  block = page.blocks.create!
  column = block.columns.create(columns: 4)
  tile = column.create_tile!
  tile.components.create!(type: "Widgit::Components::Text", text: "Some text")

  column = block.columns.create(columns: 6)
  tile = column.create_tile!
  tile.components.create!(type: "Widgit::Components::Text", text: "Some text")
end
