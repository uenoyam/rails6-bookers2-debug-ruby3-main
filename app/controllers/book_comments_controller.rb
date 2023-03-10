class BookCommentsController < ApplicationController
  
  before_action :ensure_correct_user, only: [:destroy]
  
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
      if @book_comment.save
         redirect_back(fallback_location: root_path)
      else
    @user = @book.user
    @book1 = Book.new
          render "books/show"
      end
  end
  
  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
    private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
  
  def ensure_correct_user
    @comment = BookComment.find(params[:id])
    unless @comment.user == current_user
       redirect_back(fallback_location: root_path)
    end
  end
  
end
