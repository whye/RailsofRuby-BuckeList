class ListsController < ApplicationController
    def index
        @var = List.all
    end

    def new
        @records = List.new
    end

    def create
        @records = List.new(params.require(:list).permit(:name, :reason))
        if @records.save
            redirect_to lists_url, notice:"create new successfully"
        else
            render action: "new"
        end
    end

    def edit
        @records = List.find(params[:id])
    end

    def update
        @records = List.find(params[:id])

        if @records.update_attributes(params.require(:list).permit(:name, :reason))
            redirect_to lists_path, notice:"update success"
        else
            render action: "edit"
        end
    end

    def show
        @records = List.find(params[:id])
    end

    def destroy
        @records = List.find(params[:id])
        @records.destroy
        redirect_to lists_path, notice: "You have successfully destroyed."
    end
    #RESTful
end
