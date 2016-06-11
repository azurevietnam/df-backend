require 'rails_helper'

RSpec.describe Order::UpdateOrder do
  describe "#call" do
    context "update order successfully" do
      round_type = Order.ROUND_TYPEs[:ONE_WAY]
      depart_flight_code = "VN123"
      depart_date= Date.new(2016, 11, 20)
      depart_from_time= Time.local(2016,10,25,10,20,0)
      depart_to_time= Time.local(2016,10,25,12,0,0)
      depart_book_code= "FDJKH"
      depart_web_price_net= 900000
      depart_total= 900000
      return_flight_code= "BL543"
      return_date= Date.new(2016, 12, 10)
      return_from_time= Time.local(2016,10,25,14,20,0)
      return_to_time= Time.local(2016,10,25,15,30,0)
      return_book_code= "REJ24F"
      return_web_price_net= 500000
      return_total= 1400000
      total_price = depart_total + return_total
      contact_note = "Pay later"
      admin_note = "This is trusted customer"
      
      before(:each) do
        @updated_contact = FactoryGirl.build(:customer)
        @updated_customer = FactoryGirl.create(:customer)
        @ori_place = FactoryGirl.create(:place_bmt)
        @des_place = FactoryGirl.create(:place_sgn)
        @depart_airline = FactoryGirl.create(:airline_vna)
        @return_airline = FactoryGirl.create(:airline_jet)
      
        @original_order = FactoryGirl.create(:order, :round_trip, adult: 1, child: 0, infant: 0)
        @passengers = @original_order.passengers
        @update_params = {
          order_id: @original_order.id,
          customer_id: @updated_customer.id,
          contact_name: @updated_contact.name,
          contact_phone: @updated_contact.phone,
          contact_email: @updated_contact.email,
          contact_gender: @updated_contact.gender,
          round_type: round_type,
          adult: 100,
          child: 0,
          infant: 0,
          ori_place_id: @ori_place.id, 
          des_place_id: @des_place.id,
          depart_airline_id: @depart_airline.id,
          depart_flight_code: depart_flight_code,
          depart_date: depart_date,
          depart_from_time: depart_from_time,
          depart_to_time: depart_to_time,
          depart_book_code: depart_book_code,
          depart_web_price_net: depart_web_price_net,
          depart_total: depart_total,
          return_airline_id: @return_airline.id,
          return_flight_code: return_flight_code,
          return_date: return_date,
          return_from_time: return_from_time,
          return_to_time: return_to_time,
          return_book_code: return_book_code,
          return_web_price_net: return_web_price_net,
          return_total: return_total,
          total_price: total_price,
          contact_note: contact_note,
          admin_note: admin_note,
          passengers_attributes: [
            {id: @passengers[0].id, no: 1, name: FFaker::Name.name, gender: Customer.GENDERs[:FEMALE], category: Passenger.CATEGORies[:ADULT]}
          ]
        }
        contact_info = double(Order::ContactInfo)                                            
        get_customer_order = Order::GetCustomerOrder.new
        update_order = Order::UpdateOrder.new(@update_params, get_customer_order, contact_info)
        @updated_order = update_order.call.data
      end
      it "return updated order" do
        expect(@updated_order.customer).to eql @updated_customer
        expect(@updated_order.contact_name).to eql @updated_contact.name
        expect(@updated_order.contact_phone).to eql @updated_contact.phone
        expect(@updated_order.contact_email).to eql @updated_contact.email
        expect(@updated_order.contact_gender).to eql @updated_contact.gender
        expect(@updated_order.ori_code).to eql @ori_place.code
        expect(@updated_order.des_code).to eql @des_place.code
        expect(@updated_order.depart_airline).to eql @depart_airline
        expect(@updated_order.return_airline).to eql @return_airline
        expect(@updated_order.depart_flight_code).to eql depart_flight_code
        expect(@updated_order.depart_date.to_s).to eql depart_date.to_s
        expect(Helper::Order::ExtractTime.call(@updated_order.depart_from_time)).to eql Helper::Order::ExtractTime.call(depart_from_time)
        expect(Helper::Order::ExtractTime.call(@updated_order.depart_to_time)).to eql Helper::Order::ExtractTime.call(depart_to_time)
        expect(@updated_order.depart_book_code).to eql depart_book_code
        expect(@updated_order.depart_web_price_net).to eql depart_web_price_net
        expect(@updated_order.depart_total).to eql depart_total
        expect(@updated_order.return_flight_code).to eql return_flight_code
        expect(@updated_order.return_date.to_s).to eql return_date.to_s
        expect(Helper::Order::ExtractTime.call(@updated_order.return_from_time)).to eql Helper::Order::ExtractTime.call(return_from_time)
        expect(Helper::Order::ExtractTime.call(@updated_order.return_to_time)).to eql Helper::Order::ExtractTime.call(return_to_time)
        expect(@updated_order.return_book_code).to eql return_book_code
        expect(@updated_order.return_web_price_net).to eql return_web_price_net
        expect(@updated_order.return_total).to eql return_total
        expect(@updated_order.passengers[0].name).to eql @update_params[:passengers_attributes][0][:name]
      end
      it "not update adult or child or infant number" do
        expect(@updated_order.adult).to eql @original_order.adult
        expect(@updated_order.child).to eql @original_order.child
        expect(@updated_order.infant).to eql @original_order.infant
      end
      it "not update order number" do
        expect(@updated_order.order_number).to eql @original_order.order_number
      end
      it "not update round type" do
        expect(@updated_order.round_type).to eql @original_order.round_type
      end
    end
    
    context "update order failed when cannot find order" do
      before(:each) do
        @original_order = FactoryGirl.create(:order, :round_trip, adult: 1, child: 0, infant: 0)
        @update_params = {
          order_id: -1
        }
        contact_info = double(Order::ContactInfo)                                            
        get_customer_order = double(Order::GetCustomerOrder)
        update_order = Order::UpdateOrder.new(@update_params, get_customer_order, contact_info)
        @updated_order = update_order.call
      end
      it "return an error message" do
        expect(@updated_order).to be_an_instance_of(Response::Error)
      end
      it "return the error message on why the order cannot be created" do
        expect(@updated_order.message).to include "Couldn't find Order with"
        expect(@updated_order.error_type).to be_an_instance_of(ActiveRecord::RecordNotFound)
      end
    end
  end
end