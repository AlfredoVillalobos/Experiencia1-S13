class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(params_sale)
    if params[:tax] == "1"
      @sale.total = (@sale.value - @sale.discount) * 1.19
      @sale.tax = 19
    else
      @sale.tax = 0
    end

    if @sale.save
      redirect_to sales_done_path
    else 
      redirect_to sales_new_path
    end
  end

  def done
    @sales = Sale.all
  end
    
  private

  def params_sale
    params.require(:sale).permit(:cod, :detail, :category, :value )
  end
end
