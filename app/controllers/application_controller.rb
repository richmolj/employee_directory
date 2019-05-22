class ApplicationController < ActionController::API
<<<<<<< Updated upstream
  # Previously, we applied these by default
  # Now need to be explicit
  respond_to :json, :jsonapi

  # NO LONGER INCLUDE THESE
  #include Graphiti::Rails
  #include Graphiti::Responders

  # NO LONGER MANUALLY REGISTER
  #register_exception Graphiti::Errors::RecordNotFound,
    #status: 404
=======
  # TODO - just include graphiti rails
  include Graphiti::Rails::Responders
  #include Graphiti::Rails
  #include Graphiti::Responders

  #register_exception Graphiti::Errors::RecordNotFound,
    #status: 404
  #
  #DETAIL IS NULL? 401 default
  register_exception FooError,
    status: 401, message: ->(e) { "foo #{e.class}" },
    meta: ->(e) { { redirect_uri: e.class.name } }

  #rescue_from Exception do |e|
    #handle_exception(e, show_raw_error: true)
  #end
  def show_detailed_exceptions?
    false
  end
>>>>>>> Stashed changes
end
