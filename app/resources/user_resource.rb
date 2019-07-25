class UserResource < ApplicationResource
  self.adapter = Graphiti::Adapters::Null
  self.model = OpenStruct

  filter :id, single: true do
    eq do |scope, value|
      scope.merge!(id: value)
    end
  end

  def base_scope
    {}
  end

  def resolve(scope)
    [OpenStruct.new(id: scope[:id])]
  end
end
