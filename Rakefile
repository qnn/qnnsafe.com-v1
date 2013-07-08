trap("SIGINT") { exit! }

task :default do
  exec 'rake -T'
end

desc 'Build site (jekyll build)'
task :build do
  exec 'jekyll build'
end

desc 'Preview on local machine (jekyll serve --watch)'
task :preview do
  exec 'jekyll serve --watch'
end
