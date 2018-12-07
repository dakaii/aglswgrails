class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project
  attributes :title, :thumbnail, :description, :created_at, :updated_at
end
