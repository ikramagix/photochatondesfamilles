class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items or /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items or /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.item = Item.find(params[:item_id])
    @cart_item.cart = current_user.cart # ou une autre méthode pour obtenir le panier de l'utilisateur
  
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_items_url, notice: 'Item was successfully added to cart.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    @cart_item = CartItem.find(params[:id])
  if params[:increment]
    @cart_item.quantity += 1
  elsif params[:decrement]
    @cart_item.quantity -= 1 if @cart_item.quantity > 1
  end
  if @cart_item.save
    redirect_to cart_path(@cart_item.cart), notice: 'Quantity updated.'
  else
    redirect_to cart_path(@cart_item.cart), alert: 'Error updating quantity.'
  end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to cart_path(@cart_item.cart), notice: 'Item removed from cart.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :item_id)
    end
end
