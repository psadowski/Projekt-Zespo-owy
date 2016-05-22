class AdminController < ApplicationController
    skip_before_filter :verify_authenticity_token
    
    def index
        if user_signed_in?
            if current_user.role == 'admin'
                @all_users = nil
                if !params[:q].nil?
                    @all_users = User.where(surname: params[:q])
                    if @all_users.empty?
                        flash.clear
                        flash.now[:error] = "User not found!"
                        
                    else 
                        flash.clear
                        flash.now[:success] = "User found."
                        
                    end
                end
            else
                redirect_to (root_path)
            end
        else
            redirect_to (root_path)
        end
    end
    
    def admin_edit_user
        if params[:id]
            @user = User.find(params[:id])
            @departments = Department.all
            @user_departments = @user.department
            @subjects = Subject.all
            @user_subjects = @user.subject
            @user_groups = @user.group
            @groups = Group.all
        end
    end
    
    def save_user
        id = params[:user_id]
        role = params[:role]
        @user = User.find(id)
        @user.update_attribute(:role, role)
        flash[:success] = 'Profile has been updated.'
        redirect_to :back  
    end
    
    def delete_department
        user_id = params[:user_id]
        department_id = params[:department_id]
        User.find(user_id).department.delete(Department.find(department_id))
        subject_ids = User.find(user_id).subject.where(:department_id => department_id).ids
        User.find(user_id).subject.delete(Subject.where(:department_id => department_id))
        
        subject_ids.each do |id|
            User.find(user_id).group.delete(Group.where(:subject_id => id))
        end
        flash[:success] = "Department has been deleted."
        redirect_to :back
    end
    
    def add_department
        user_id = params[:user_id]
        department_id = params[:department_id]
        User.find(user_id).department << Department.find(department_id)
        redirect_to :back
    end
    
    def delete_subject
        user_id = params[:user_id]
        subject_id = params[:subject_id]
        User.find(user_id).subject.delete(Subject.find(subject_id))
        User.find(user_id).group.delete(Group.where(:subject_id => subject_id))
        flash[:success] = "Subject has been deleted."
        redirect_to :back
    end
    
    def delete_group
        user_id = params[:user_id]
        group_id = params[:group_id]
        User.find(user_id).group.delete(Group.find(group_id))
        flash[:success] = "Group has been deleted."
        redirect_to :back
    end
    
    def add_subject
        user_id = params[:user_id]
        subject_id = params[:subject_id]
        User.find(user_id).subject << Subject.find(subject_id)
        flash[:success] = "Subject has been added."
        redirect_to :back
    end
    
    def add_group
        user_id = params[:user_id]
        group_id = params[:group_id]
        User.find(user_id).group << Group.find(group_id)
        flash[:success] = "Group has been added."
        redirect_to :back
    end
    
    def red_button
        @button = RedButton.first
    end
    
    def  turn_on_button
        @button = RedButton.first
        
        if !@button.button
            @button.button = !@button.button
            @button.save 
        end
        
        redirect_to :back
    end
    
    def  turn_off_button
        @button = RedButton.first
        
        if @button.button
            @button.button = !@button.button
            @button.save 
        end
        
        redirect_to :back
    end
    
    def if_admin
        if !(current_user.role == 'admin')
            redirect_to root
        end
    end
end