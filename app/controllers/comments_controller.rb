class CommentsController < ApplicationController
  before_action :find_entry

  def create
    @comment = @entry.comments.new(comment_params)
    if @comment.save
        render status: :ok
    else
        render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def index
    @comments = @entry.comments.order('created_at DESC')
    if @comments
      render status: :ok
    else
      render json: {comment: "not found"}, status: :not_found
    end
  end

  def show
		@comment = Comment.find(params[:id])
    if @comments
      render status: :ok
    else
      render json: {comment: "not found"}, status: :not_found
    end
	end

  def destroy
    @comment = @entry.comments.find(params[:id])
    if @comment
      @comment.destroy
    else
      render json: {comment: "not found"}, status: :not_found
    end
  end

  def update_put
    @comment = Comment.find(params[:id])
    if @comment
      if comment_params[:author] and comment_params[:body]
        @comment.update(comment_params)
      else
        render json: {comment: "missing author or comment"}, status: :unprocessable_entity
      end
    else
      render json: {comment: "not found"}, status: :not_found
    end
  end

  def update_patch
    @comment = Comment.find(params[:id])
    if @comment
      @comment.update(comment_params)
    else
      render json: {comment: "not found"}, status: :not_found
    end
  end

  private

    def comment_params
      params.permit(:author, :comment)
    end
    def find_entry
			@entry = Entry.find(params[:entry_id])
    end

end
