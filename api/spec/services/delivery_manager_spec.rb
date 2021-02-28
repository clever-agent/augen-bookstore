require "rails_helper"

RSpec.describe DeliveryManager  do
    context 'assign_delivery' do 
        it 'wrong delivery_type - return false' do
            # Arrange
            order_id = 1
            delivery_type = "abc"

            # Act
            result = DeliveryManager.assign_delivery(order_id, delivery_type)

            # Assert
            expect(result).to eq false
        end
    end
end