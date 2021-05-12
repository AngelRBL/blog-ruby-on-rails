class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, null: false, foreign_key: true, default: 1
  end
end
# por defecto rails va asumir que no puede crear un registro de articles sin un usuario.
