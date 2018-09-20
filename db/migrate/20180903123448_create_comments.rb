class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.belongs_to :article

      t.timestamps
    end
  end
end
