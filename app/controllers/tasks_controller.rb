class TasksController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasks = current_user.tasks.build  # form_for 用
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end
 
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def created
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが投稿されませんでした'
      render :new
    end  
  end  

  def edit
    
  end
  
  def update
    
  end  

  def destroy
  end
  
  private
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end  
  
end
