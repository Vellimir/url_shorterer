class ChangeDefaulCountForUrl < ActiveRecord::Migration[6.0]

  def change
    change_column_default :urls, :count, 0
  end

end
