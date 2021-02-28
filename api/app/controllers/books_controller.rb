class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def query_book
        book_manager = BookManager.new
        books = book_manager.search_book params[:q]
        render :json => books
    end

    def buy_book
        book_manager = BookManager.new
        books = book_manager.buy_book params
        render :json => {"success": true}
    end
end