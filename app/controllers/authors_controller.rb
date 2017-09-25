class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
    #render :show
  end

  def new
    @author = Author.new
    #render :new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    find_author
    #render :edit
  end

  def update
    find_author
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def find_author
    @author = Author.find_by(id: params[:id])
  end
end
