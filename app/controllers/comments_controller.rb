class CommentsController < ApplicationController

  def create
    @comment = @entry.comments.new(comment_params)
    if @comment.save
        render json: @comment, status: :created
    else
        render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
		comment = Comment.find(params[:id])
		render json: {status: 'SUCCESS', message:'Loaded article', data:comment},status: :ok
	end

  def destroy
    @comment = @entry.comments.find_by(params[:id])
    if @comment
      @comment.destroy
    else
      render json: {comment: "not found"}, status: :not_found
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:name, :body, :entry_id)
  end

end
