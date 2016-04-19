class VisitorsController < ApplicationController
  skip_before_action :authenticate
  def index
    @ideas = Idea.all
    p "============================#{@ideas}"
  end
end
