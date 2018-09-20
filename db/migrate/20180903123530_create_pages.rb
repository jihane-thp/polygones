class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :type

 	  t.belongs_to :menu
 	  t.belongs_to :template
 	  
      t.timestamps
    end
  end
end
