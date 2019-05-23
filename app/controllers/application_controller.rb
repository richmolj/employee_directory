class ApplicationController < ActionController::API
  # TODO - just include graphiti rails
  include Graphiti::Rails::Responders
  #include Graphiti::Rails
  #include Graphiti::Responders

  #register_exception Graphiti::Errors::RecordNotFound,
    #status: 404
  #
  register_exception FooError,
    status: 401, message: ->(e) { "foo #{e.class}" },
    meta: ->(e) { { redirect_uri: e.class.name } }

  #rescue_from Exception do |e|
    #handle_exception(e, show_raw_error: true)
  #end
  def show_detailed_exceptions?
    false
  end
end
