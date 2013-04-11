require "minitest/matchers"
require "minitest/rails"

if defined?(ActiveRecord)
  require "shoulda/matchers/active_record"

  Shoulda::Matchers::ActiveRecord.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class ActiveSupport::TestCase
    include Shoulda::Matchers::ActiveRecord
  end
end

if defined?(ActiveModel)
  require "shoulda/matchers/active_model"

  Shoulda::Matchers::ActiveModel.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class ActiveSupport::TestCase
    include Shoulda::Matchers::ActiveModel
  end
end

if defined?(ActionController)
  require "shoulda/matchers/action_controller"

  Shoulda::Matchers::ActionController.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class ActionController::TestCase
    include Shoulda::Matchers::ActionController
  end
end
