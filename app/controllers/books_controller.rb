class BooksController < ApplicationController
    def index
        @books = Book.all.limit(25)
        render json: @books
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def create
    end
end
