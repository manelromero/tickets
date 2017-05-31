task :default => :start

task :start do
  sh 'bundle exec rackup -p 4567 config.ru'
end

task :test do
  sh 'bundle exec rspec'
end
