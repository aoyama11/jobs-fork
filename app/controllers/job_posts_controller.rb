class JobPostsController < ApplicationController
  before_action :find_job_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @job_posts = JobPost.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @job_posts = JobPost.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(job_posts_params)

    if @job_post.save
      redirect_to @job_post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @job_post.update(job_posts_params)
      redirect_to @job_post
    else
      render 'edit'
    end
  end

  def destroy
    @job_post.destroy
    redirect_to root_path
  end

  private

  def job_posts_params
    params.require(:job_post).permit(:title, :description, :company, :url, :category_id)
  end

  def find_job_post
    @job_post = JobPost.find(params[:id])
  end
end
