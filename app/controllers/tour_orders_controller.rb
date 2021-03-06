class TourOrdersController < ApplicationController
  include AlipayGeneratable

  before_action :authenticate_user_from_token!, except: [:alipay_web_notify, :alipay_wap_notify, :alipay_app_notify, :alipay_done]
  before_action :authenticate_user!, except: [:alipay_web_notify, :alipay_wap_notify, :alipay_app_notify, :alipay_done]
  
  before_action :set_tour_order, only: [:show, :edit, :update, :destroy, 
            :pay, :cancel, :refund, :complete]

  # GET /tour_orders
  # GET /tour_orders.json
  def index
    @tour_orders = current_user.tour_orders
    if params[:state]
      @tour_orders = @tour_orders.where(state: params[:state])
    end
  end

  # GET /tour_orders/1
  # GET /tour_orders/1.json
  def show
  end

  # GET /tour_orders/new
  def new
    @tour_order = TourOrder.new
  end

  # GET /tour_orders/1/edit
  def edit
  end

  # POST /tour_orders
  # POST /tour_orders.json
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @tour_order = @ticket.tour_orders.build(tour_order_params)
    @tour_order.user_id = current_user.id

    respond_to do |format|
      if @tour_order.save
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully created.' }
        format.json { render :show, status: :created, location: @tour_order }
      else
        format.html { render :new }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_orders/1
  # PATCH/PUT /tour_orders/1.json
  def update
    respond_to do |format|
      if @tour_order.update(tour_order_params)
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_order }
      else
        format.html { render :edit }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_orders/1
  # DELETE /tour_orders/1.json
  def destroy
    @tour_order.destroy
    respond_to do |format|
      format.html { redirect_to tour_orders_url, notice: 'Tour order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /tour_orders/1/pay
  # POST /tour_orders/1/pay.json
  def pay
    if @tour_order.in_progress?
      respond_to do |format|
        format.html { redirect_to generate_pay_link_by_order(@tour_order) }
        format.json { render json: {url: generate_wap_pay_link_by_order(@tour_order)} }
      end
      
    end
  end

  def alipay_done
    render text: "您已支付成功"
  end

  def alipay_web_notify
    notify_params = params.except(*request.path_parameters.keys)

    if Alipay::Notify.verify?(notify_params)
      alipay_notify! params
      render :text => 'success'
    else
      render :text => 'error'
    end
  end

  def alipay_wap_notify
    notify_params = params.except(*request.path_parameters.keys)

    if Alipay::Notify::Wap.verify?(notify_params)
      alipay_params = {}
      alipay_params[:id] = params[:id]
      alipay_params[:out_trade_no] = Hash.from_xml(params[:notify_data])['notify']['out_trade_no']
      alipay_params[:trade_status] = Hash.from_xml(params[:notify_data])['notify']['trade_status']

      alipay_notify! alipay_params
      render :text => 'success'
    else
      render :text => 'error'
    end
  end

  def alipay_app_notify
    notify_params = params.except(*request.path_parameters.keys)

    if Alipay::Notify::App.verify?(notify_params)
      alipay_notify! params
      render :text => 'success'
    else
      render :text => 'error'
    end
  end

  # POST /tour_orders/1/cancel
  # POST /tour_orders/1/cancel.json
  def cancel
    @tour_order.cancel
    respond_to do |format|
      if @tour_order.save
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully canceled.' }
        format.json { render :show, status: :ok, location: @tour_order }
      else
        format.html { redirect_to @tour_order }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tour_orders/1/refund
  # POST /tour_orders/1/refund.json
  def refund
    @tour_order.refund
    respond_to do |format|
      if @tour_order.save
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully refunded.' }
        format.json { render :show, status: :ok, location: @tour_order }
      else
        format.html { redirect_to @tour_order }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tour_orders/1/complete
  # POST /tour_orders/1/complete.json
  def complete
    @tour_order.complete
    respond_to do |format|
      if @tour_order.save
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully completed.' }
        format.json { render :show, status: :ok, location: @tour_order }
      else
        format.html { redirect_to @tour_order }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_order
      @tour_order = current_user.tour_orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_order_params
      params.require(:tour_order).permit(:number, :ticket_id, :user_phone, :user_name, :outdate)
    end

    def alipay_notify! alipay_params
      @order = TourOrder.find alipay_params[:id]
      if ['TRADE_SUCCESS', 'TRADE_FINISHED'].include?(alipay_params[:trade_status])
        if @order.token == alipay_params[:out_trade_no] && @order.may_pay?
          @order.pay!
          @order.sms 
        end
      elsif alipay_params[:trade_status] == 'TRADE_CLOSED'
        @order.cancel!
      end
    end
end
