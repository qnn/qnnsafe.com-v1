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

desc 'Beautify stores.JSON'
task :beautify do
  require 'json'
  require 'unicode_utils'
  require 'fileutils'
  stores_json = File.expand_path('../stores.js', __FILE__)
  stores = IO.read(stores_json)
  stores.gsub!(/(\/\*{js}\*\/).*\1/, '')
  stores = JSON.parse(stores)

  all_widths = stores.map do |store|
    store.map do |info|
      UnicodeUtils.display_width(info.to_s)
    end
  end

  max_widths = all_widths.transpose.map do |width|
    width.max + 1
  end

  count = 0

  File.open(stores_json + '.new', 'w') do |output|
    File.open(stores_json).read.each_line do |line|
      if line =~ /",/
        line = line.gsub(/",\s*/).with_index do |match, index|
          '",' + " " * (max_widths[index] - all_widths[count][index])
        end
        count += 1
      end
      output.puts line
    end
  end

  FileUtils.mv stores_json + '.new', stores_json
end
