class CheckoutController < ApplicationController
        
    def create
      @cart = current_user.cart
      update_total
      @total = @cart.total_price

        @session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [
            {
              price_data: {
                currency: 'eur',
                unit_amount: (@total*100).to_i,
                product_data: {
                  name: 'Rails Stripe Checkout',
                },
              },
              quantity: 1
            },
            metadata: {
              cart_id: @cart_id
            },
          ],
          mode: 'payment',
          success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
          cancel_url: checkout_cancel_url
        )
        redirect_to @session.url, allow_other_host: true
      end

      def update_total
        @cart = current_user.cart
        @cart.total_price = @cart.cart_items.sum { |cart_item| cart_item.quantity * cart_item.item.price }
        @cart.save
      end

      def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
        if @payment_intent.status == 'succeeded'
          create_order_from_cart
        else
          redirect_to root_path, notice: "Payment failed. Please try again."
        end
      end

      def cancel
      end

      private 

      def create_order_from_cart
        Order.create_from_cart(current_user.cart)
      end
end
