module Serializable
  def serialize(object, **options)
    if options[:class_name]
      serializer = options[:class_name]
    else
      serializer = object.send(object.is_a?(ActiveRecord::Relation) ? :klass : :class).name + 'Serializer'
      serializer = serializer.constantize
    end
    passing_params = options[:params] || {}
    defined?(current_client) && passing_params[:client] = current_client unless passing_params[:client]

    serializer.new(object, params: passing_params).serialized_json
  end
end
