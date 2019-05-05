# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_success(result, options: {})
    render json: serialize_json(result, options), status: :ok
  end

  def render_error(result)
    render json: serialize_json(result), status: :unprocessable_entity
  end

  private

  def serialize_json(result, options = {})
    options.merge!(include: [included_params])
    klass = result_type(result.includes(included_params))
    klass.new(result, options).serialized_json
  rescue NameError
    { data: [] }.to_json
  end

  def included_params
    params.fetch(:includes, {})
  end

  def result_type(result)
    result = result.first if result.respond_to?(:map)
    "#{result.class.name}Serializer".constantize
  end
end
