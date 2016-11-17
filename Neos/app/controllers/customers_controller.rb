class CustomersController < ApplicationController

  def promotion
    if active_order.order_items.empty?
      flash[:notice] = 'Your basket is empty.'
      redirect_to root_path
    end
  end

  def checkpromo
      @promo = Promotion.where(:code => params[:promotion][:code], :status => 1).first
      if @promo.blank?
        flash[:notice] = 'Not a valid promo code.'
        redirect_to customers_promotion_path
      else
        @order = active_order

        if @order.order_promotions.present?

          @promotion_ids = @order.order_promotions.pluck(:promotion_id)
          @placedPromo   = Promotion.where(:id => @promotion_ids,:status => 1,:is_conjunction => 0).first
          if @placedPromo.present?
            flash[:notice] = 'This promo code can not be apply.'
            redirect_to new_customer_path
          else
            if @promo.reduction_type == 'percent'
              @reduction  = (@order.subtotal.to_s.to_d * @promo.reduction.to_s.to_d)/100
            else
              @reduction  = @promo.reduction
            end

            @order.order_promotions.new(:promotion_id => @promo.id)
            @order.reduction = @reduction
            @order.total  = @order.total.to_s.to_d - @reduction.to_s.to_d
            @order.save
            redirect_to new_customer_path
          end

        else

          if @promo.reduction_type == 'percent'
            @reduction  = (@order.subtotal.to_s.to_d * @promo.reduction.to_s.to_d)/100
          else
            @reduction  = @promo.reduction
          end

          @order.order_promotions.new(:promotion_id => @promo.id)
          @order.reduction = @reduction
          @order.total  = @order.total.to_s.to_d - @reduction.to_s.to_d
          @order.save
          redirect_to new_customer_path

        end
      end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      @order = active_order
      @order.order_status_id = 2
      @order.save
      session.delete(:order_id)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :address, :email, :cardno)
    end
end
