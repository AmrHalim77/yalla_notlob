class GroupsController < ApplicationController
      before_action :set_group, only: [:show, :edit, :destroy]

  def index
    @groups=Group.where(:user_id => current_user.id)
  end
  def addmember
    @a = params[:group]
    @member = User.where(:email => @a["email"])
    
    @friendship = Friendship.where("friend_id = #{@member.ids[0]} AND user_id = #{current_user.id}")
    if @friendship.present?
      @add_member = Groupmember.new(group_params)
      @add_member.user_id = @member.ids[0]
      @add_member.save()
    end


    p "******************************************************"
    p @a["email"]
    p params[:group_id]
    p "Erooooooooooooooooooor AMrrrrrrrrrrrrrrrrrrrrrrrrr"
    p "******************************************************"
    @asd = params[:email]
  end
  def show
   

  end

  def new
   
  end

  def edit
  end

  def destroy
    @group.destroy
  end
    def update
    @group = Group.find(params[:id_friend])
    if @group.friends == nil 
         @group.friends.first = params[:search]
    else  
         @group.friends << params[:search]
    end
    @group.save
    

    end
  def create
  @group = Group.new(group_params)
    @group.user_id = current_user.id
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
    params.require(:group).permit(:name,:group_id, :email)
  end  

end

