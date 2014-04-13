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

  def edit
    @product = find_product
  end

  def update
    @product = find_product

    if @product.update(product_params)
      flash[:success] = 'Product updated'
      redirect_to registry_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = find_product
    @product.destroy
    flash[:success] = 'Product removed'
    redirect_to registry_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :link, :price, :image)
  end

  def find_product
    Product.find(params[:id])
  end
end
