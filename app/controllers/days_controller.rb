class DaysController < ApplicationController
  before_filter :authenticate_user!

  def edit
    date = Date.parse(params[:id])
    @day = current_user.day(date) || Day.new(:date=>date)
  end

  def create
    redirect_to_date current_user.days.create(params[:day]).date
  end

  def update
    edit
    @day.user_id=current_user.id
    @day.update_attributes(params[:day])

    redirect_to_date @day.date
  end
  
  def destroy
    edit
    Day.delete(@day.id)
    redirect_to_edit @day.date
  end
  
  def index
    redirect_to_edit Date.today
  end
  
  private
  def redirect_to_date date
    if "Save" === params[:commit]
      redirect_to_edit date
    else
      redirect_to_edit date + 1
    end
  end

  def redirect_to_edit date
    redirect_to :controller => "days", :action => "edit", :id => date.to_s
  end
end
