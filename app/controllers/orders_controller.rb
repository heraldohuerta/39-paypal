class OrdersController < ApplicationController
  before_action :authenticate_user!
# before_action :authenticate_user, only: [:pag1, :pag2]
# before_action :authenticate_user, except: [:pag3, :pag4]
  # before_action :filter_admin!

  def destroy
    byebug
  end
  def pagar
      # master_order = MasterOrder.find(params[:id_order])
      # master_order.status = true
      # master_order.save
      # redirect_to products_path, notice:'Se ha generado la compra, se ha enviado un correo con el detalle'
  end

  def create
    byebug
    if params[:cantidad] == '0' || params[:cantidad] == ''
        redirect_to root_path, alert:'No puede ser cantidad cero'
    else
      master_order = MasterOrder.where(user_id: current_user.id, status: false)
      if master_order.count ==  0
          # Si no tiene ordenes abiertas genero una nueva
          orden = MasterOrder.create(user_id:current_user.id, status: false)
          number_order = orden.id
          master_order = orden
      else
          number_order = master_order.first.id
      end

      @order = Order.new
      @order.product = Product.find(params[:product_id])
      @order.quantity = params[:cantidad]
      @order.master_order_id = number_order
      @order.price = @order.product.price
      @order.user = current_user
      if @order.save
        redirect_to root_path, notice:'Se ha ingresado al carrito de compra'
      else
        redirect_to root_path, alert:'Problema al cargar carrito de compra'
      end
    end
  end

  def index
      carro = current_user.master_orders.where(status: false)
      @total = 0
      @orders = []
      if carro.count > 0
        @orders = carro.take.orders
        @orders.each do  |v|
          @total += ( v.price.to_i * v.quantity.to_i )
        end
      end
  end

# private
#
#     def filter_admin!
#       authenticate_user!
#       redirect_to root_path, alert: "No tienes acceso" unless current_user.isadmin?
#     end
end
