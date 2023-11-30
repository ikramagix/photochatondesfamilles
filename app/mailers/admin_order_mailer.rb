class AdminOrderMailer < ApplicationMailer
    def admin_notification_mail(order, admin)
      @order = order
      @admin = admin
      @url = ''
      mail(to: @admin.email, subject: 'Nouvelle commande effectuée')
    end
  end