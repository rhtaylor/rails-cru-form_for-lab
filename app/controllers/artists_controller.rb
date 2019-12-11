class ArtistsController < ApplicationController
    
    
    
    def index
        @artists = Artist.all
    end

    def show 
        @artist = Artist.find(params[:id])
    end
    def new  
        @artist = Artist.new
    end
    def create 
        @artist = Artist.create(sanitized_params(:name, :bio)) 
        redirect_to artist_path(@artist)
    end 
    def edit 
        @artist = Artist.find(params[:id])
    end 
    def update 
    
        @artist = Artist.update(sanitized_params(:name, :bio)) 
        redirect_to artist_path(@artist)
    end


    private 

    def sanitized_params(*args) 
        params.require(:artist).permit(*args) 
       
    end

end
