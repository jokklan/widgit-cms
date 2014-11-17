ActiveRecord::Base.transaction do
  Widgit::Page.create!(title: 'Test').tap do |page|
    page.blocks.create! do |block|
      block.columns.build(columns: 12) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Header", text: "Some header")
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end
    end

    page.blocks.create! do |block|
      block.columns.build(columns: 6) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end

      block.columns.build(columns: 6) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end
    end

    page.blocks.create! do |block|
      block.columns.build(columns: 4) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end

      block.columns.build(columns: 4) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end

      block.columns.build(columns: 4) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end
    end

    page.blocks.create! do |block|
      block.columns.build(columns: 4) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end

      block.columns.build(columns: 8) do |column|
        column.create_tile! do |tile|
          tile.components.build(type: "Widgit::Components::Text", text: "Some text")
        end
      end
    end
  end
end
