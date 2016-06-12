class AddStatusAndCodeToSmsMessages < ActiveRecord::Migration
  def change
    add_column :sms_messages, :status, :string
    add_column :sms_messages, :code, :string
  end
end
