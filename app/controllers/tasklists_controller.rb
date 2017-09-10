class TasklistsController < ApplicationController

  def index
    @tasklists = Tasklist.all
  end

  def show
    @tasklist = Tasklist.find(params[:id])
    @task = @tasklist.tasks.build
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    tasklist_params = params[:tasklist].permit(:name, :description, :duedate, :status)

    tasklist = Tasklist.new(tasklist_params)

    if tasklist.save
        redirect_to tasklist_path(id: tasklist.id)
    else
        if tasklist.name == ""
           flash[:notice] = "Please enter a valid name for the tasklist!"
        end
        redirect_to new_tasklist_path
    end
  end

  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  def update
    tasklist_params = params[:tasklist].permit(:name, :description, :duedate, :status)
    @tasklist = Tasklist.find(params[:id])

    if @tasklist.update(tasklist_params)
        redirect_to tasklist_path(id: @tasklist.id)
    else
         if @tasklist.name == ""
           flash[:notice] = "Please enter a valid name for the tasklist!"
         end
        render :edit
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    flash[:notice] = "Tasklist '#{@tasklist.name}' successfully deleted"
    @tasklist.destroy
    redirect_to tasklists_path

  end
end

