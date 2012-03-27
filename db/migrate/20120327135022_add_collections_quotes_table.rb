class AddCollectionsQuotesTable < ActiveRecord::Migration
  def up
    create_table :collections_quotes, :id => false do |t|
      t.references :collection, :null => false
      t.references :quote, :null => false
    end

    add_index(:collections_quotes, [:collection_id, :quote_id], :unique => true)
  end

  def down
    drop_table :collections_quotes
  end
end
