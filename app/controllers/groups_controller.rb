class GroupsController < ApplicationController
  before_filter :redirect_on_bad_date, only: [:show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find params[:id]
    @posts = @group.posts_for date
    @date = date
  end

  def date
    return Time.zone.today if params[:date].nil?
    Date.parse(params[:date])
  rescue
    nil
  end

  def redirect_on_bad_date
    if date.nil?
      redirect_to group_path(params[:id])
      return
    end
  end

end
