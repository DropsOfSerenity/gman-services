class Order::Line < ActiveRecord::Base
  establish_connection "grossman_#{Rails.env}".to_sym

  self.primary_key = 'OrderKey'
  self.table_name = 'InvCustomerOrders_Open_Detail'

  def self.default_scope
    select(column_names.map(&:to_s))
  end

  # OrderKey
  # InOrd_WareShipToOrderKey
  def self.column_names
    %w{
      ItemId
      InOrd_QtyShipped
    }
  end
end