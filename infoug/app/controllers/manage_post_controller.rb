class ManagePostController < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_action :if_employee
    
    def if_employee
        if current_user.role != 'employee'
            redirect_to (root_path)
        end
    end
    
    def index
        user_id = current_user.id
        @user_posts = PostGroup.where(:user_id => user_id) + PostSubject.where(:user_id => user_id) +
            PostDepartment.where(:user_id => user_id)
        @user_posts = @user_posts.flatten.sort {|f,s| f.updated_at <=> s.updated_at}.reverse
        @user_departments = User.find(user_id).department
        @user_subjects = User.find(user_id).subject 
        @user_groups = User.find(user_id).group
    end
    
    def add_post
        if params[:posts_to_department].nil?
           redirect_to :back
           flash[:error] = "You must select at least one department!"
        else
            topic = params[:topic]
            text = params[:text]
            user_id = params[:user_id]
            posts_to_department = params[:posts_to_department]
            posts_to_subject = params[:posts_to_subject]
            posts_to_group = params[:posts_to_group]
            
            if posts_to_group.nil?
                if posts_to_subject.nil?
                    posts_to_department.each do |ptd|
                        PostDepartment.create(:user_id => user_id, :text => text, :topic => topic,
                                            :department_id => ptd)
                    end
                else
                    posts_to_subject.each do |pts|
                        PostSubject.create(:user_id => user_id, :text => text, :topic => topic,
                                            :subject_id => pts)
                    end
                end
            else
                posts_to_group.each do |ptg|
                    PostGroup.create(:user_id => user_id, :text => text, :topic => topic,
                                        :group_id => ptg)
                end
            end
            flash[:success] = "Your post has been added."
            redirect_to :back
        end
    end
    
    def delete_post
        table_name = params[:table_name]
        post_id = params[:post_id]
        
        if table_name == 'post_departments'
            PostDepartment.find(post_id).delete
        elsif table_name == 'post_subjects'
            PostSubject.find(post_id).delete
        elsif table_name == 'post_groups'
            PostGroup.find(post_id).delete
        end
        flash[:success] = "Your post has been deleted."
        redirect_to :back
    end
    
    def edit_post
        table_name = params[:table_name]
        post_id = params[:post_id]
        
        if table_name == 'post_departments'
            @post = PostDepartment.find(post_id)
        elsif table_name == 'post_subjects'
            @post = PostSubject.find(post_id)
        elsif table_name == 'post_groups'
            @post = PostGroup.find(post_id)
        end
    end
    
    def update_post
        table_name = params[:table_name]
        post_id = params[:post_id]
        topic = params[:topic]
        text = params[:text]
        
        if table_name == 'post_departments'
            @post = PostDepartment.find(post_id)
            @post.topic = topic
            @post.text = text
            @post.save
        elsif table_name == 'post_subjects'
            @post = PostSubject.find(post_id)
            @post.topic = topic
            @post.text = text
            @post.save
        elsif table_name == 'post_groups'
            @post = PostGroup.find(post_id)
            @post.topic = topic
            @post.text = text
            @post.save
        end
        flash[:success] = "Your post has been edited."
        redirect_to manage_post_url
    end
end
