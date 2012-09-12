require "minitest/matchers"

if defined? ActionController
  require "shoulda/matchers/action_controller"

  class MiniTest::Rails::ActionController::TestCase
    include Shoulda::Matchers::ActionController
    extend Shoulda::Matchers::ActionController
  end
end

if defined? ActionMailer
  require "shoulda/matchers/action_mailer"

  class MiniTest::Rails::ActionMailer::TestCase
    include Shoulda::Matchers::ActionMailer
    extend Shoulda::Matchers::ActionMailer
  end
end

if defined? ActiveRecord
  require "shoulda/matchers/active_record"
  require "shoulda/matchers/active_model"

  class MiniTest::Rails::ActiveSupport::TestCase
    include Shoulda::Matchers::ActiveRecord
    extend Shoulda::Matchers::ActiveRecord
    include Shoulda::Matchers::ActiveModel
    extend Shoulda::Matchers::ActiveModel
  end
elsif defined? ActiveModel
  require "shoulda/matchers/active_model"

  class MiniTest::Rails::ActiveSupport::TestCase
    include Shoulda::Matchers::ActiveModel
    extend Shoulda::Matchers::ActiveModel
  end
end
