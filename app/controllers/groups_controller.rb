class GroupsController < ApplicationController
      before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups=Group.all
  end
  def uppddate
    
  end

  def show
  end

  def new
    @group=Group.new
  end

  def edit
  end

  def destroy
    @group.destroy
  end

  def create
  @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created' } 
        format.json { render :show, status: :created, location:@group }
      else 
        format.html { render :new}
        format.json { render json:  @group.errors, status: :unprocessable_entity }  
      end     
    end
  end
  private 

  def set_group
    @group = Group.find(params[:id])
  end
  
  def group_params
    params.require(:group).permit(:name, :user_id, :friend_id)
  end  

end

