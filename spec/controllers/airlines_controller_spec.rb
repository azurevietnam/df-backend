require 'rails_helper'

RSpec.describe AirlinesController, type: :controller do
  describe "GET #show" do
    context "when user request get a particular airline" do
      before(:each) do
        @airline = FactoryGirl.create(:airline)
        get :show, id: @airline.id
      end

      it "return the airline information" do
        airline_response = json_response
        expect(airline_response[:name]).to eql @airline.name
      end

      it {should respond_with :ok}
    end
  end
end
