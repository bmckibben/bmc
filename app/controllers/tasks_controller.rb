class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = current_user.tasks.ordered
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Task was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Task was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Task was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :start_at, :end_at, :user_id, :product_id, :task_status_id)
    end
end
