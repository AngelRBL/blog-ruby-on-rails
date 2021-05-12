class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
end
#es recomendable no utilizar nombres de modelos en español, el problema seria que no podria sacar el plural y singular de una palabra.
