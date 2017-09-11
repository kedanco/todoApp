class TasksController < ApplicationController

  def create
    tasklist = Tasklist.find(params[:tasklist_id])

    task_params = params[:task].permit(:name, :description, :duedate, :priority, :status)

    task = tasklist.tasks.new(task_params)

    task.save

    redirect_to tasklist_path(id: tasklist.id)

    # if task.save
    #     redirect_to tasklist_path(id: tasklist.id)
    # else
    #     if task.name == ""
    #        flash[:notice] = "Please enter a valid name for the task!"
    #     end
    #     redirect_to new_tasklist_task_path
    # end
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    # tasklist_params = params[:tasklist].permit(:name, :description, :duedate, :status)
    # @tasklist = Tasklist.find(params[:id])

    # if @tasklist.update(tasklist_params)
    #     redirect_to tasklist_path(id: @tasklist.id)
    # else
    #      if @tasklist.name == ""
    #        flash[:notice] = "Please enter a valid name for the tasklist!"
    #      end
    #     render :edit
    # end
  end

  def destroy
    @task = Tasks.find(params[:id])
    flash[:notice] = "Task '#{@task.name}' successfully deleted"
    tasklist_id = @task.tasklist_id
    @task.destroy
    redirect_to tasklist_path(id: tasklist_id)

  end
end
