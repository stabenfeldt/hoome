class CreateMartinTests < ActiveRecord::Migration
  def change
    create_table :martin_tests do |t|

      t.timestamps null: false
    end
  end
end
