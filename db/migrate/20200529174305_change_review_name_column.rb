class ChangeReviewNameColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.rename :name, :author
    end
  end
end
