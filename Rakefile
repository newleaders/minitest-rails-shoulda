require "bundler/gem_tasks"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "lib" << "test"
  t.pattern = "test/**/test_*.rb"
  t.verbose = true
end
