class EntriesController < ApplicationController
  def create
      @entry = Entry.new(entry_params)
      if @entry.save
        render status: :created
      else
        render json: @entry.errors, status: :unprocessable_entity
      end
  end

  def index
    @entries = Entry.order('created_at DESC')
  end

  def show
		@entry = Entry.find(params[:id])
    if @entry
      render status: :ok
    else
      render json: @entry.errors, status: :not_found
    end
		#render json: {status: 'SUCCESS', message:'Loaded article', data:entry},status: :ok
	end

  def destroy
    @entry = Entry.find(params[:id])
    if @entry
      @entry.destroy
    else
      render json: {entry: "not found"}, status: :not_found
    end
  end

  def update_put
    @entry = Entry.find(params[:id])
    if @entry
      if entry_params[:title] and entry_params[:body]
        @entry.subtitle = entry_params[:subtitle]
        @entry.update(entry_params)
      else
        render json: {entry: "missing title or body"}, status: :unprocessable_entity
      end
    else
      render json: {entry: "not found"}, status: :not_found
    end
  end

  def update_patch
    @entry = Entry.find(params[:id])
    if @entry
      @entry.update(entry_params)
    else
      render json: {entry: "not found"}, status: :not_found
    end
  end

  private

  def entry_params
      params.permit(:title, :body, :subtitle)
  end
end
