class UpdateColumnUrls < ActiveRecord::Migration
  def change
    change_column_default(:urls, :visits, 0)
  end
end
