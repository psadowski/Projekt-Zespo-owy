class StaticPagesController < ApplicationController
    skip_before_filter :verify_authenticity_token
    #before_filter :filter
    
    def home
        if cookies[:dep_filtr].nil? and cookies[:sub_filtr].nil? and cookies[:gro_filtr].nil?
            cookies[:dep_filtr] = 1
            cookies[:sub_filtr] = 1
            cookies[:gro_filtr] = 1
        end
        if user_signed_in?
            user_id = current_user.id
            user = User.find(user_id)
            user_departments = user.department
            user_subjects = user.subject
            user_groups = user.group
            @all_posts = Array.new
        
            if !user_departments.nil? and cookies[:dep_filtr].to_i == 1
                user_departments.each do |u_d|
                    @all_posts << PostDepartment.where(:department_id => u_d.id)
                end
            end
            
             if !user_subjects.nil? and cookies[:sub_filtr].to_i == 1
                user_subjects.each do |u_s|
                    @all_posts << PostSubject.where(:subject_id => u_s.id)
                end
            end
            
             if !user_groups.nil? and cookies[:gro_filtr].to_i == 1
                user_groups.each do |u_g|
                    @all_posts << PostGroup.where(:group_id => u_g.id) 
                end
            end
            @all_posts = @all_posts.flatten.sort {|f,s| f.updated_at <=> s.updated_at}.reverse.paginate(:page => params[:page], :per_page => 10)
        else
            redirect_to new_user_session_url 
        end
    end

        
    # end
    def filter
        if cookies[:dep_filtr].nil? and cookies[:sub_filtr].nil? and cookies[:gro_filtr].nil?
            cookies[:dep_filtr] = 1
            cookies[:sub_filtr] = 1
            cookies[:gro_filtr] = 1
        end
        show_dep_posts = params[:show_department_posts]
        show_sub_posts = params[:show_subject_posts]
        show_gro_posts = params[:show_group_posts]

        if !show_dep_posts.nil?
            if cookies[:dep_filtr] == 1.to_s
                cookies[:dep_filtr] = 0
            else
                cookies[:dep_filtr] = 1
            end
        end
        
        if !show_sub_posts.nil?
            if cookies[:sub_filtr] == 1.to_s
                cookies[:sub_filtr] = 0
            else
                cookies[:sub_filtr] = 1
            end
        end
        
        if !show_gro_posts.nil?
            if cookies[:gro_filtr]. == 1.to_s
                cookies[:gro_filtr] = 0
            else
                cookies[:gro_filtr] = 1
            end
        end
        redirect_to :root
    end

end