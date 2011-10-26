class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :text
      t.integer :author_id
      t.string :source_url

      t.timestamps
    end
  end
end
