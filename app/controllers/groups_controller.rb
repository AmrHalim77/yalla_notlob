class GroupsController < ApplicationController
  def index
    @groups=Group.all
  end

  def show
  end

  def new
    @groups=Group.new
  end

  def edit
  end

  def destroy
  end

  def create
  @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html {redirect_to @group, notice: 'Group was successfully created'}
        format.json {render :show, status: :created, location:@group}
      else 
        format.html {render :new}
        format.json {render json:  @group.errors, status: :unprocessable_entity}  
      end     
    end
  end

end

