class BriefingsController < ApplicationController
    
    before_action :find_briefing, only[:show, :edit, :update, :destroy]

    def new
        @briefing = Briefing.new
    end 

    def create
        @briefing = Briefing.new briefing_params
        @briefing.user = current_user
        if @briefing.save
            flash[:notice] = 'Briefing created successfully'
            redirect_to briefing_path(@briefing)
        else
            render :edit
        end 
    end


    def show
    end 

    def index
        @briefings = Briefing.order(created_at: :desc)
    end 

    def edit

    end     

    def update
        if @briefing.update briefing_params
            flash[:alert] = 'Briefing updated successfully'
            redirect_to @briefing
        else
            render :edit
        end 
    end 

    def destroy 
        @briefing.destory
        flsh[:notice] = "Briefing deleted successfully"
        redirect_to briefing_path
    end 

    private

    def briefing_params
        params.require(:briefing).permit(:id, {file_path_ids: []} })
    end 

    def find_briefing
        @briefing = Briefing.find params[:id]        
    end 

end
