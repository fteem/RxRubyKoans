require 'rake/testtask'

task :test do
  Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/*_about_*.rb']
    t.verbose = true
  end
end

task :default => :test


