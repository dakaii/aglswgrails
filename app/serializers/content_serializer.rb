class ContentSerializer
  include FastJsonapi::ObjectSerializer
  set_type :content
  attributes :project_id, :title, :type, :created_at, :updated_at
end
