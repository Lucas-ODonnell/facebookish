class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params) 
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile) 
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id]) 
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:job, :phone, :email, :location, :website, :state, :city, :country, :zipcode, :father, :mother, :brothers, :sisters, :hometown, :gender, :birthday, :language, :bio, :highschool, :college)
  end
end
