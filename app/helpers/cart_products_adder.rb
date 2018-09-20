module CartProductsAdder
  include AuthContextHelper

  def add_product(product_id, quantity)

    initialize_this_fields(product_id, quantity)

    @cart_products.each do |cart_product|
      if cart_product.product_id == @product.id
        update_cart_product(cart_product)
        @contains = true
        break
      end
    end

    if !@contains
      create_cart_product
    end
  end

  private

  def initialize_this_fields(product_id, quantity)
    @product = Product.find(product_id)
    @quantity = quantity

    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @contains = false
  end

  def update_cart_product(cart_product)
    cart_product.quantity += @quantity
    cart_product.price += (@quantity * @product.price.to_f)
    cart_product.save
  end

  def create_cart_product
    @cart_product = CartProduct.new
    @cart_product.product = @product
    @cart_product.quantity = @quantity
    @cart_product.price = (@cart_product.quantity * @product.price.to_f)
    @cart_product.cart = @cart
    @cart_product.save
  end

end