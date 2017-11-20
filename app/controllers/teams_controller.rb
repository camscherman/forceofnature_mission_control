class TeamsController < ApplicationController
  def new
    @team = Team.new
  end
  def create
    puts team_params
    @team = Team.new(team_params)
    if @team.save
     redirect_to team_path(@team)
    else
     render :new
    end
  end
  def show
    find_team
    #@users = User.all
    #@membership = Membership.new
  end
  def edit
    find_team
  end

  def update
    find_team
    if @team.update team_params
      redirect_to @team
    else
      render :edit
    end
  end
  def destroy
  find_team
  @team.destroy
  redirect_to teams_path
  end
  def index
  @teams = Team.order(created_at: :desc)
  end

  private
    def team_params
      params.require(:team).permit(:name, {user_ids:[]})
    end
    def find_team
      @team = Team.find params[:id]
    end

end
