task :deploy => [:"deploy:compile_assets", :"deploy:push"]

namespace :deploy do
  task :compile_assets => :"assets:precompile" do
    system('git', 'add', 'public/assets')
    system('git', 'commit', '-m', 'Adding assets for deployment', 'public/assets')
  end

  task :push do
    system('git', 'push', 'heroku', 'master')
  end
end
