class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :post_id
      t.text :body

      t.timestamps null: false
    end
  end
end
