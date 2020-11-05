class Prefecture < ActiveRecord::Migration[6.0]
  def change
    change_column_default :students, :prefecture, from: nil, to: 0
  end
end
