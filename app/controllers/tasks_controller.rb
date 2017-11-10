class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :new_task, only: [:new, :index]
  #new before action new_task allows the new action to happen on the index page 

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    
    # added the ability to add a task in the index page
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    # removed @task = Task.new and moved to private method new_task
    # in order to dry up code and also to not reload the page each time
    # the user makes a new task
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        # format.html { redirect_to @task, notice: 'Task was successfully created.' }
        # This prevents the redirect to the tasks#show
        format.html { redirect_to tasks_url }
        # instead we redirect into the task list
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        # format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        # commented out so that page is not redirected to task#show page
        format.html { redirect_to tasks_url }
        # instead the task is updated on the index page and is not redirected elsewhere
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name)
    end

    # Added new task ajax on homepage
    def new_task
      @task = Task.new
    end
end
