class ProductsController < ApplicationController
  def index
    @productos = Product.all
  end

  def destroy
    borrar = Order.find(params[:order_id])
    if !borrar.nil?
     borrar.destroy
      respond_to do |format|
        format.html { redirect_to orders_path, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
   end

  end

end
