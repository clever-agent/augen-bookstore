require "rails_helper"

RSpec.describe DeliveryCostFactor, type: :model  do
    context 'calculate_cost' do 
        it 'cost factor nil - return 0' do
            # Arrange
            delivery_type = "abc"
            delivery_date = "20200202"

            allow(DeliveryCostFactor).to receive(:find_by_service).with(delivery_type).and_return(nil)

            # Act
            result = DeliveryCostFactor.calculate_cost delivery_type, delivery_date

            # Assert
            expect(result).to eq 0
        end

        it 'invalid delivery date - return 0' do
            # Arrange
            delivery_type = "abc"
            delivery_date = "99920200202"

            cost_factor = DeliveryCostFactor.new({base_cost: 10, jun_to_aug: 1, sep: 2, other_months: 3})
            allow(DeliveryCostFactor).to receive(:find_by_service).with(delivery_type).and_return(cost_factor)

            # Act
            result = DeliveryCostFactor.calculate_cost delivery_type, delivery_date

            # Assert
            expect(result).to eq 0
        end

        it 'delivery date in june to august - return right cost' do
            # Arrange
            delivery_type = "abc"
            delivery_date = "20200701"

            cost_factor = DeliveryCostFactor.new({base_cost: 10, jun_to_aug: 1, sep: 2, other_months: 3})
            allow(DeliveryCostFactor).to receive(:find_by_service).with(delivery_type).and_return(cost_factor)

            # Act
            result = DeliveryCostFactor.calculate_cost delivery_type, delivery_date

            # Assert
            expect(result).to eq 10
        end

        it 'delivery date in sep - return right cost' do
            # Arrange
            delivery_type = "abc"
            delivery_date = "20200901"

            cost_factor = DeliveryCostFactor.new({base_cost: 10, jun_to_aug: 1, sep: 2, other_months: 3})
            allow(DeliveryCostFactor).to receive(:find_by_service).with(delivery_type).and_return(cost_factor)

            # Act
            result = DeliveryCostFactor.calculate_cost delivery_type, delivery_date

            # Assert
            expect(result).to eq 20
        end

        it 'delivery date in other months - return right cost' do
            # Arrange
            delivery_type = "abc"
            delivery_date = "20200101"

            cost_factor = DeliveryCostFactor.new({base_cost: 10, jun_to_aug: 1, sep: 2, other_months: 3})
            allow(DeliveryCostFactor).to receive(:find_by_service).with(delivery_type).and_return(cost_factor)

            # Act
            result = DeliveryCostFactor.calculate_cost delivery_type, delivery_date

            # Assert
            expect(result).to eq 30
        end
    end
end