Spree::Admin::ReportsController.class_eval do

  module SimpleReport
    def initialize
      Spree::Admin::ReportsController.add_available_report!(:total_sales_of_each_product)
      super
    end
  end
  prepend SimpleReport

  def total_sales_of_each_product
    @variants = Spree::Variant.joins(:product, line_items: :order)
                .select("spree_variants.id, spree_products.slug as product_id, spree_products.name as name, sku, SUM(spree_line_items.quantity) as quantity, SUM((spree_line_items.price * spree_line_items.quantity) + spree_line_items.adjustment_total) as total_price")
                .where("spree_orders.store_id" => store_id)
                .where.not('spree_orders.created_at' => nil)
                .where('spree_orders.created_at' => [created_at_gt..created_at_lt])
                .group('spree_variants.id, spree_products.id, spree_products.name')
  end

  private

  def store_id
    params[:store_id].blank? ? Spree::Store.all.map(&:id) : params[:store_id]
  end

  def created_at_gt
    params[:created_at_gt] = if params[:created_at_gt].blank?
      Date.today.beginning_of_month
    else
      Date.parse(params[:created_at_gt])
    end
  end

  def created_at_lt
    params[:created_at_lt] = if params[:created_at_lt].blank?
      Date.today
    else
      Date.parse(params[:created_at_lt])
    end
  end
end
