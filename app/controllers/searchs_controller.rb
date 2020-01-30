class SearchsController < ApplicationController
	 def form
    @book = Book.new
   @user_or_book = params[:option]
   @how_search = params[:choice]

if @user_or_book == "1"
   @users = User.search(params[:search], @user_or_book, @how_search)
   render :form
else
   @books = Book.search(params[:search], @user_or_book, @how_search)
   render :form
end
end

  def search
    @book = Book.new
   @user_or_book = params[:option]
   @how_search = params[:choice]

if @user_or_book == "1"
   @users = User.search(params[:search], @user_or_book, @how_search)
   render :form
else
   @books = Book.search(params[:search], @user_or_book, @how_search)
   render :form
end
end
end
