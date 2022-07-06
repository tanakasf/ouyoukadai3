class BookCommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_url)
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :profile_image)
  end

  def correct_user

  @comment = BookComment.find(params[:id])

   if current_user.id != @comment.user.id
    redirect_to books_path
   end
  end


end
