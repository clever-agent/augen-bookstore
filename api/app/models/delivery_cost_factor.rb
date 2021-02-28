class DeliveryCostFactor < ApplicationRecord
    def self.calculate_cost delivery_type, delivery_date
        cost_factor = DeliveryCostFactor.find_by_service delivery_type
        return 0 if cost_factor.nil?

        begin
            delivery_date = delivery_date.to_datetime
        rescue Exception => ex
            return 0
        end

        factor = 1
        if delivery_date.month == 9
            factor = cost_factor.sep
        elsif delivery_date.month >= 6 && delivery_date.month <= 8
            factor = cost_factor.jun_to_aug
        else
            factor = cost_factor.other_months
        end

        return factor * cost_factor.base_cost
    end
end
