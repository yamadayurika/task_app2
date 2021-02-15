class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]


  
  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
    @counts = Task.count
    @today = Date.today.strftime('%Y年%m月%d日')
  end


  # GET /tasks/1 or /tasks/1.json
  def show
    @today = Date.today.strftime('%Y年%m月%d日')
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @today = Date.today.strftime('%Y年%m月%d日')
  end

  # GET /tasks/1/edit
  def edit
    @today = Date.today.strftime('%Y年%m月%d日')
  end

  # POST /tasks or /tasks.json
  def create
    @today = Date.today.strftime('%Y年%m月%d日')
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "スケジュールを登録しました" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "スケジュールを更新しました" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

    @today = Date.today.strftime('%Y年%m月%d日')
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "スケジュールを削除しました" }
      format.json { head :no_content }
    end
    @today = Date.today.strftime('%Y年%m月%d日')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      @today = Date.today.strftime('%Y年%m月%d日')
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :startdate, :finishdate, :allday, :memo)
    end
end
