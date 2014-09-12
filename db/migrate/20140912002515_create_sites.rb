class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
    	t.string :secret
    	t.string :hintOne
    	t.string :hintTwo
    	t.string :hintThree

      t.timestamps
    end
  end
end
