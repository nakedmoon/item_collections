class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.string :name
      t.string :url
      t.string :slug, unique: true, index: true
      t.references :user
      t.boolean :public
      t.timestamps null: false
    end
  end
end
