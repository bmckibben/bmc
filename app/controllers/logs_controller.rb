class LogsController < ApplicationController
  before_action :set_log, only: %i[ show edit update destroy ]

  # GET /logs or /logs.json
  def index
    @logs = current_user.logs.ordered
  end

  # GET /logs/1 or /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new(user_id: current_user.id)
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs or /logs.json
  def create
    @log = current_user.logs.build(log_params)

    respond_to do |format|
      if @log.save
      respond_to do |format|
        format.html { redirect_to logs_path, notice: "Log was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Log was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
    end
  end

  # PATCH/PUT /logs/1 or /logs/1.json
  def update
    if @log.update(task_params)
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Log was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Log was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Log was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Log was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.require(:log).permit(:description, :start_at, :end_at, :user_id, :task_id)
    end
end
