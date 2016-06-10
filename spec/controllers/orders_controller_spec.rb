require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  FORMAT_TIME_STR = '%H:%M'

  describe "POST #create" do
    contact_name = "Luis Hamiton"
    contact_phone = "0934955594"
    contact_email = "luis.hamilton@gmail.com"
    contact_gender = Customer.GENDERs[:MALE]
    contact_name2 = "Barack Obama"
    contact_phone2 = "0123543543"
    contact_email2 = "obama@gmail.com"
    contact_gender2 = Customer.GENDERs[:FEMALE]

    before(:each) do
      @customer = FactoryGirl.create(:customer)
      @ori_place = FactoryGirl.create(:place_bmt)
      @des_place = FactoryGirl.create(:place_sgn)
      @depart_airline = FactoryGirl.create(:airline_vna)
      @return_airline = FactoryGirl.create(:airline_jet)
    end

    context "when create order round trip successfully" do
      round_type = Order.ROUND_TYPEs[:ROUND_TRIP]
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

        post :create, order: {
          customer_id: @customer.id,
          contact_name: contact_name,
          contact_phone: contact_phone,
          contact_email: contact_email,
          contact_gender: contact_gender,
          round_type: round_type,
          adult: 1,
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
            {no: 1, name: FFaker::Name.name, gender: Customer.GENDERs[:FEMALE], category: Passenger.CATEGORies[:ADULT]}
          ]
        }

        @order_response = json_response
      end

      it "renders correct order response" do        
        expect(@order_response[:contact_name]).to eql contact_name
        expect(@order_response[:contact_phone]).to eql contact_phone
        expect(@order_response[:contact_email]).to eql contact_email
        expect(@order_response[:contact_gender]).to eql contact_gender
        expect(@order_response[:round_type]).to eql round_type
        expect(@order_response[:depart_flight_code]).to eql depart_flight_code
        expect(@order_response[:depart_date].to_s).to eql depart_date.to_s
        expect(extract_time_string_from_String(@order_response[:depart_from_time])).to eql extract_time_string_from_Time(depart_from_time)
        expect(extract_time_string_from_String(@order_response[:depart_to_time])).to eql extract_time_string_from_Time(depart_to_time)
        expect(@order_response[:depart_book_code]).to eql depart_book_code
        expect(@order_response[:depart_web_price_net]).to eql depart_web_price_net
        expect(@order_response[:depart_total]).to eql depart_total
        expect(@order_response[:return_flight_code]).to eql return_flight_code
        expect(@order_response[:return_date].to_s).to eql return_date.to_s
        expect(extract_time_string_from_String(@order_response[:return_from_time])).to eql extract_time_string_from_Time(return_from_time)
        expect(extract_time_string_from_String(@order_response[:return_to_time])).to eql extract_time_string_from_Time(return_to_time)
        expect(@order_response[:return_book_code]).to eql return_book_code
        expect(@order_response[:return_web_price_net]).to eql return_web_price_net
        expect(@order_response[:return_total]).to eql return_total
        expect(@order_response[:total_price]).to eql total_price
        expect(@order_response[:contact_note]).to eql contact_note
        expect(@order_response[:admin_note]).to eql admin_note
      end

      it { should respond_with :created }
    end

    context "when create order for existed customer" do
      before(:each) do
        post :create, order: {
          customer_id: @customer.id,
          contact_name: contact_name,
          contact_phone: contact_phone,
          contact_email: contact_email,
          contact_gender: contact_gender,
          round_type: Order.ROUND_TYPEs[:ONE_WAY],
          ori_place_id: @ori_place.id, 
          des_place_id: @des_place.id,
          depart_airline_id: @depart_airline.id,
        }

        @order_response = json_response
      end

      it "belong to existed customer" do
        expect(@order_response[:customer_id]).to eql @customer.id
      end

      it "save contact person information independence to existed customer" do
        expect(@order_response[:contact_name]).to eql contact_name
        expect(@order_response[:contact_phone]).to eql contact_phone
        expect(@order_response[:contact_email]).to eql contact_email
        expect(@order_response[:contact_gender]).to eql contact_gender
      end
    end

    context "when create order for no-existed customer" do
      before(:each) do
        post :create, order: {
          contact_name: contact_name2,
          contact_phone: contact_phone2,
          contact_email: contact_email2,
          contact_gender: contact_gender2,
          round_type: Order.ROUND_TYPEs[:ONE_WAY],
          ori_place_id: @ori_place.id, 
          des_place_id: @des_place.id,
          depart_airline_id: @depart_airline.id,
        }

        @order_response = json_response
        @new_customer = Customer.find(@order_response[:customer_id])
      end

      
      it "create new customer based on contact person information" do
        expect(@order_response[:contact_name]).to eql @new_customer.name
        expect(@order_response[:contact_phone]).to eql @new_customer.phone
        expect(@order_response[:contact_email]).to eql @new_customer.email
        expect(@order_response[:contact_gender]).to eql @new_customer.gender
      end
    end

    context "when order cannot create" do
      before(:each) do
        post :create, order: {
          contact_name: contact_name2,
          contact_phone: contact_phone2,
          contact_email: contact_email2,
          contact_gender: contact_gender2,
          round_type: Order.ROUND_TYPEs[:ONE_WAY]
        }
        @order_response = json_response
      end
      it "return an errors json" do
        expect(@order_response).to have_key(:errors)
      end
      it "return the json errors on why the order cannot be created" do
        expect(@order_response[:errors]).to include "some parameters are missed"
      end
    end
  end
  
  describe "SHOW #get" do
    context "when order can get from its id" do
      before(:each) do
        @order = FactoryGirl.create(:order)
        get :show, id: @order.id
        
        @order_response = json_response
      end
      
      it "return correct order by id" do
        expect(@order_response[:id]).to eql @order.id
      end
      
      it {should respond_with :ok}
    end
    
    context "when order cannot found from its id" do
      before(:each) do
        get :show, id: -1
        
        @order_response = json_response
      end
      it "return an errors json" do
        expect(@order_response).to have_key(:errors)
      end
      it "return message order cannot find" do
        expect(@order_response[:errors]).to include "Couldn't find"
      end
    end
  end
  
  describe "FIND #find" do
    context "when found order from its order number" do
      before(:each) do
        @order = FactoryGirl.create(:order)
        get :find, order_number: @order.order_number
        
        @order_response = json_response
      end
      
      it "return correct order by order number" do
        expect(@order_response[:id]).to eql @order.id
      end      
    end
    
    context "when cannot found order from its order number" do
      before(:each) do
        get :find, order_number: "CANNOT_HAVE_THIS_ORDER_NUMBER"
        
        @order_response = json_response
      end
      it "return an errors json" do
        expect(@order_response).to have_key(:errors)
      end
      it "return message order cannot find" do
        expect(@order_response[:errors]).to include "Couldn't find"
      end
    end
  end

  private
    def extract_time_string_from_Time(time)
      time.strftime(FORMAT_TIME_STR)
    end

    def extract_time_string_from_String(time_str)
      time_str.to_time.utc.strftime(FORMAT_TIME_STR)
    end
end
