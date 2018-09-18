class ChangeReviewTextName < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews,:review,:content
  end
end
