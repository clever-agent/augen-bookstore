Rails.application.routes.draw do
	get 'books/query_book', to: 'books#query_book'
  post 'books/buy_book', to: 'books#buy_book'

  get 'settings/get_delivery_cost_factor', to: 'settings#get_delivery_cost_factor'
end
