class Registry::ProductsController < RegistryController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = 'Product created'
      redirect_to registry_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :link, :price, :image)
  end
end
