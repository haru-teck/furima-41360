class AddExplanationToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :explanation, :text, null: false
  end
end
