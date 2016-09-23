class CreateOtherTransits < ActiveRecord::Migration[5.0]
  def change
    create_table :other_transits do |t|

      t.timestamps
    end
  end
end
