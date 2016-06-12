class SmsMessagesController < ApplicationController
  before_action :set_sms_message, only: [:show]

  def index
    @sms_messages = SmsMessage.all
    render json: @sms_messages
  end

  def show
    render json: @sms_message
  end

  def create
    begin
      @order = Order.find_by!(id: sms_message_params[:order_id])
      sms_content = Sms::SmsTemplateBinding.get_content(@order, sms_message_params[:sms_message_type].to_i)
      sms_sender = Sms::SmsSender.new(sms_content, @order.contact_phone)
      sms_response = sms_sender.send
      if (sms_response.success?)
        sms_response_data = sms_response.data
        @sms_message = @order.sms_messages.new()
        @sms_message.type = sms_message_params[:sms_message_type]
        @sms_message.content = sms_sender
        @sms_message.to_phone = @order.contact_phone
        @sms_message.trans_id = sms_response_data[:data][:tranId]
        @sms_message.total_sms = sms_response_data[:data][:totalSMS]
        @sms_message.total_price = sms_response_data[:data][:totalPrice]
        @sms_message.status = sms_response_data[:status]
        @sms_message.code = sms_response_data[:code]
        if @sms_message.save
          render json: @sms_message, status: :created, location: @sms_message
        else
          render json: @sms_message.errors, status: :unprocessable_entity
        end
      else
        render json: sms_sender.message, status: :unprocessable_entity
      end
    rescue ArgumentError => ex
      render json: ex.message, status: :unprocessable_entity
    end
  end

  private
    def set_sms_message
      @sms_message = SmsMessage.find(params[:id])
    end
    def sms_message_params
      params.require(:sms_message).permit(:order_id, :sms_message_type)
    end
end
