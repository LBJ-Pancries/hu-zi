class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required
  def index
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new

  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "Product deleted"
    redirect_to :back
  end

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to :back

  end

  def dresses
    @products = Product.where(:category => "dresses").paginate(:page => params[:page], :per_page => 5)
  end

  def jeans
    @products = Product.where(:category => "jeans").paginate(:page => params[:page], :per_page => 5)
  end

  def skirts
    @products = Product.where(:category => "skirts").paginate(:page => params[:page], :per_page => 5)
  end

  def shorts
    @products = Product.where(:category => "shorts").paginate(:page => params[:page], :per_page => 5)
  end

  def suits
    @products = Product.where(:category => "suits").paginate(:page => params[:page], :per_page => 5)
  end

  private

  def product_params
    params.require(:product).permit(:title, :writer, :description, :quantity, :price, :image, :press, :subtitle, :translator, :year, :pages, :ISBN, :about_author, :category)
  end
end
