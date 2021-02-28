require "rails_helper"

RSpec.describe DeliveryService  do
    context 'assign_delivery' do 
        it 'wrong delivery_type - return false' do
            # Arrange
            order_id = 1
            delivery_type = "abc"

            # Act
            result = DeliveryService.assign_delivery(order_id, delivery_type)

            # Assert
            expect(result).to eq false
        end

        it 'right delivery_type - return true' do
            # Arrange
            order_id = 1
            delivery_type = "Train"

            # Act
            result = DeliveryService.assign_delivery(order_id, delivery_type)

            # Assert
            expect(result).to eq true
        end
    end
end