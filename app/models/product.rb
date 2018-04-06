class Product < ApplicationRecord
  has_many :orders

  #UN PRODUCTO PUEDE ESTAR EN MUCHAS ORDENES (muchos usuarios)
  # QUE DE GUARDARA EN ORDERS
  # LAS DOS LINEAS VAN JUNTAS
  has_many :orders
  has_many :users, through: :orders


end
