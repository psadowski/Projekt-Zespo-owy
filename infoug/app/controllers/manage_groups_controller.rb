class ManageGroupsController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def index
        @user = User.find(current_user.id)
        @departments = Department.all
        @user_departments = @user.department
        @subjects = Subject.all
        @user_subjects = @user.subject
        @user_groups = @user.group
        @groups = Group.all
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
    
end
