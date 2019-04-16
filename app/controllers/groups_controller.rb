class GroupsController < ApplicationController
      before_action :set_group, only: [:show, :edit, :destroy]

  def index
    @groups=Group.where(:user_id => current_user.id)
  end
<<<<<<< HEAD
  def uppddate
    
  end
=======
  def addmember
    @a = params[:group]
    @member = User.where(:email => @a["email"]) 
    
    @friendship = Friendship.where("friend_id = #{@member.ids[0]} AND user_id = #{current_user.id}")
    @add_member = Groupmember.new
    @add_member.user_id = @member.ids[0]
    @add_member.group_id = params[:group_id]
    @add_member.user_email = @a["email"]
    @add_member.save
>>>>>>> c6d2ffd895496a327ce19a7f874ad21f3a9562e6


     @asd = params[:email]

    redirect_to "/groups/#{params[:group_id]}"
    # redirect_to(:action => 'show' , {:group_id => params[:group_id]})
  end
  def show
    p "******************************************************"
    p params
    p "Erooooooooooooooooooor AMrrrrrrrrrrrrrrrrrrrrrrrrr"
    p "******************************************************"
   
   @groupmembers = Groupmember.where(:group_id => params[:id])

  end
  def deletemember
    @groupmember = Groupmember.find(params[:default_id])
    @groupmember.destroy

    redirect_to "/groups/#{params[:id]}"
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
<<<<<<< HEAD
    params.require(:group).permit(:name, :user_id, :friend_id)
=======
    params.require(:group).permit(:name,:group_id, :email)
>>>>>>> c6d2ffd895496a327ce19a7f874ad21f3a9562e6
  end  

end

