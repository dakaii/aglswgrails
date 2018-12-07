class ProjectsController < ApplicationController
    before_action :authenticate_user,  only: [:create]

    private def project_params
        params.require(:project).permit(:title, :thumbnail, :description)
    end

    def index
        projects = Project.order('created_at DESC')
        render json: ProjectSerializer.new(projects).serialized_json
    end

    def create
        project = Project.new(project_params)
        if project.save
            render json: ProjectSerializer.new(project).serialized_json
        else
            render json: { error: project.errors.full_messages }, status: :bad_request
        end
    end

end
