require 'rails_helper'
require "validates_email_format_of/rspec_matcher"

RSpec.describe Customer, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:gender) }
  subject { FactoryGirl.build(:customer) }
  it { should validate_uniqueness_of(:phone).case_insensitive }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_email_format_of(:email).with_message('is not looking good') }
  it { should_not allow_values('03fsaff934').for(:phone)}
  it { should_not allow_values('12345').for(:phone)}
  it { should allow_values('01224410620').for(:phone)}
end