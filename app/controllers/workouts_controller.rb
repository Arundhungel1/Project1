class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  def index
   @workouts = Workout.all.order("created_at DESC")
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
    if @workout.save
      current_user.workouts << @workout
      redirect_to workouts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :mood, :length, :user_id)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
