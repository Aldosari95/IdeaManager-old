class VisitorsController < ApplicationController
  skip_before_action :authenticate
  def index
    @platforms = Platform.all
    if params[:order] == "asc"
      @ideas = Idea.all.order(name: :asc)
    elsif params[:order] == "desc"
      @ideas = Idea.all.order(name: :desc)
    elsif params[:order] == "oldest"
      @ideas = Idea.all.order(created_at: :asc)
    else
      @ideas = Idea.all.order(created_at: :desc)
    end

    @ideas = @ideas.where(platform_id: params[:platform_id]) if params[:platform_id]
    @roles = Role.all
  end
end
