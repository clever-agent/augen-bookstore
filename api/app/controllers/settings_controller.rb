class SettingsController < ApplicationController
    def get_delivery_cost_factor
        render :json => DeliveryCostFactor.all
    end
end