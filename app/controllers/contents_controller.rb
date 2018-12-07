class ContentsController < ApplicationController
    before_action :authenticate_user,  only: [:create]

    private def content_params
        params.require(:content).permit(:title, :type)
    end

    def create
        content = Content.new(content_params)
        content[:project_id] = params[:project_id]
        content[:user_id] = current_user.id
        if content.save
            render json: ContentSerializer.new(content).serialized_json
        else
            render json: { error: content.errors.full_messages }, status: :bad_request
        end
    end

    def show
        contents = Content.order('created_at DESC')
        render json: ContentSerializer.new(contents).serialized_json
    end

    def update
        content = Content.find_by(id: params[:content_id])
        if !content
            render json: { error: "Not Found" }, status: :not_found
        elsif content[:user_id] != current_user.id
            render json: { error: "Permission Denied" }, status: :forbidden
        elsif content.update(content_params)
            render json: ContentSerializer.new(content).serialized_json
        else
            render json: { error: content.errors.full_messages }, status: :bad_request
        end
    end

    def destroy
        content = Content.find_by(id: params[:content_id])
        if !content
            render json: { error: "Not Found" }, status: :not_found
        elsif content[:user_id] != current_user.id
            render json: { error: "Permission Denied" }, status: :forbidden
        elsif content.destroy
            render json: nil, status: :no_content
        else
            render json: { error: content.errors.full_messages }, status: :bad_request
        end
    end

end
