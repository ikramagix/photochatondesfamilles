class OrderConfirmationMailer < ApplicationMailer
    def order_confirmation_mail(order)
        @order = order
        @user = order.user
        @url = ''  
        mail(to: @user.email, subject: 'Merci pour votre commande, voici la/les photos que vous avez acheté !')
    end
end
