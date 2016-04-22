class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :respond]
  before_action :set_roles, only: [:new, :create, :show, :edit, :update]
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy, :show]

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
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = current_user.ideas.create(idea_params.merge({ role_ids: params[:idea][:role_ids].map{ |v| v.to_i } }))

    respond_to do |format|
      if @idea.errors.blank?
        @idea.ideas_users.first.update(action_type: IdeasUser.action_types[:owner])
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def respond
    user_ids = @idea.user_ids

    respond_to do |format|
      if @idea.update(user_ids: user_ids << current_user.id)
        format.html { redirect_to @idea, notice: ' Respond to an application idea successfully.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :show }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @idea.update(idea_params.merge({ role_ids: params[:idea][:role_ids].map{ |v| v.to_i } }))
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :additional_info, :platform_id)
    end

    def set_roles
      @roles = Role.all
    end


end
