require "minitest/matchers"

if defined?(ActiveRecord)
  require "minitest/rails/active_support"
  require "shoulda/matchers/active_record"

  Shoulda::Matchers::ActiveRecord.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class MiniTest::Rails::ActiveSupport::TestCase
    include Shoulda::Matchers::ActiveRecord
  end
end

if defined?(ActiveModel)
  require "minitest/rails/active_support"
  require "shoulda/matchers/active_model"

  Shoulda::Matchers::ActiveModel.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class MiniTest::Rails::ActiveSupport::TestCase
    include Shoulda::Matchers::ActiveModel
  end
end

if defined?(ActionController)
  require "minitest/rails/action_controller"
  require "shoulda/matchers/action_controller"

  Shoulda::Matchers::ActionController.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class MiniTest::Rails::ActionController::TestCase
    include Shoulda::Matchers::ActionController
  end
end

if defined?(ActionMailer)
  require "minitest/rails/action_mailer"
  require "shoulda/matchers/action_mailer"

  Shoulda::Matchers::ActionMailer.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  class MiniTest::Rails::ActionMailer::TestCase
    include Shoulda::Matchers::ActionMailer
  end
end
