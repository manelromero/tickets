task :default => :start

task :start do
  sh 'bundle exec rerun -- rackup --port 4567 config.ru'
end

task :test do
  sh 'bundle exec rspec'
end

task :tag, [:tag] do |task, arg|
  sh "bundle exec rspec --tag #{arg.tag}"
end
