class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def query_book
        books = BookstoreService.search_book params[:q]
        render :json => books
    end

    def buy_book
        books = BookstoreService.buy_book params
        render :json => {"success": true}
    end
end