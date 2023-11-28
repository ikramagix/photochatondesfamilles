class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :set_cart, only: [:new, :create]

  require 'stripe'

  Stripe.api_key = Rails.configuration.stripe[:secret_key]

  YOUR_DOMAIN = 'http://localhost:3000/'

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    build_order_items_from_cart
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        create_stripe_session
        format.html { redirect_to stripe_payment_url, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def build_order_items_from_cart
    @cart.cart_items.each do |cart_item|
      @order.order_items.build(item: cart_item.item)
    end
  end

  def create_stripe_session
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: build_line_items_for_stripe,
      mode: 'payment',
      success_url: payment_success_order_url(@order),
      cancel_url: order_url(@order),
    })

    session_id = session.id
    session_data = { order_id: @order.id, stripe_session_id: session_id }
    session[:stripe_session] = session_data
  end

  def build_line_items_for_stripe
    line_items = []

    @order.order_items.each do |order_item|
      line_items << {
        price_data: {
          currency: 'eur',
          product_data: {
            name: order_item.item.name,
            description: order_item.item.description,
          },
          unit_amount: order_item.item.price * 100,
        },
        quantity: 1,
      }
    end

    line_items
  end

  def order_params
    params.require(:order).permit(:total_price, :user_id)
  end
end