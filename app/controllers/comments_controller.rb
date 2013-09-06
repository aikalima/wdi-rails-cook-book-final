class CommentsController < ApplicationController
  respond_to :js

  def new
    @comment = Comment.new
    @comment.book_id = params[:book_id]
    respond_with(@comment)
  end

  def create
    c = params[:comment]
    @comment = Comment.new(c)
    flash[:notice] = 'Comment was successfully created.' if @comment.save
    book = Book.find(c[:book_id])
    respond_with(book, :location => books_path)
  end

end
