class StepsController < ApplicationController
    def create
        @list = List.find(params[:list_id])
        @step = @list.steps.new(params.require(:step).permit(:description))
        if @step.save
            redirect_to list_url(@list)
        else
            redirect_to list_url(@list)
        end
    end

    def complet
        @list = List.find(params[:list_id])
        @step = Step.find(params[:id])
        @step.complete = true
        @step.save
        redirect_to list_url(@list)
    end
end
