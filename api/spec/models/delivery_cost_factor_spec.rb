require "rails_helper"

RSpec.describe DeliveryCostFactor  do
    context 'calculate_cost' do 
        it 'cost factor nil - return 0' do
            # Arrange
            delivery_type = "abc"
            delivery_date = "20200202"

            allow(DeliveryCostFactor).to receive(find_by_service).with(delivery_type).and_return(nil)

            # Act
            result = DeliveryCostFactor.calculate_cost delivery_type, delivery_date

            # Assert
            expect(result).to eq 10
        end
    end
end