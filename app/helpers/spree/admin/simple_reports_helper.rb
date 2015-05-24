module Spree::Admin::SimpleReportsHelper
  def supports_store_id?
    Spree::Order.column_names.include? "store_id"
  end
end
