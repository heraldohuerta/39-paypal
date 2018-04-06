class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         #UN USUARIO PUEDE TENER MUCHOS PRODUCTOS
         # QUE DE GUARDARA EN ORDERS
        # USER -> ORDERS <- PRODUCTO
        # Un usuario puede tener muchos PRODUCTOS
        # Un producto puede tener muchos usuarios

         has_many :orders
         has_many :products, through: :orders

         has_many :master_orders

end
