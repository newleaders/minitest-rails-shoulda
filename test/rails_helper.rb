require "minitest/autorun"
require "action_controller/railtie"
require "active_model"

class TestApp < Rails::Application
  config.secret_token = "821c600ece97fc4ba952d67655b4b475"
  config.secret_key_base = "821c600ece97fc4ba952d67655b4b475"
  config.eager_load = false
  initialize!
  routes.draw do
    root to: 'hello#world'
  end
end
class HelloController < ActionController::Base
  def world
    render inline: "<!DOCTYPE html><title>TestApp</title>
                    <h1>Hello <span>World</span></h1>
                    <nav><ul><li><a href='/'>home</a></li></ul></nav>
                    <p><label>Email Address<input type='text'></label></p>
                    <button>random button</button>
                    <label>going<input type='checkbox' checked='checked'></label>
                    <label>avoid<input type='checkbox'></label>"
  end
end

class Person
  include ActiveModel::Validations

  attr_accessor :name

  validates_presence_of :name

end

Rails.application = TestApp

require "rails/test_help"
require "minitest/rails"
require "minitest/rails/shoulda"

# hack for usiing AS::TestCase for Person class too.
ActiveSupport::TestCase.register_spec_type(ActiveSupport::TestCase) do |desc|
  desc < ActiveModel::Validations if desc.is_a? Class
end


begin
  require 'turn/autorun'
  Turn.config.format = :progress
rescue LoadError; end
