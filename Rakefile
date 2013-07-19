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

def get_stores
  require 'json'
  require 'unicode_utils'
  require 'fileutils'
  stores_json = File.expand_path('../stores.js', __FILE__)
  stores = IO.read(stores_json)
  stores.gsub!(/(\/\*{js}\*\/).*\1/, '')
  JSON.parse(stores)
end

desc 'Beautify stores.js'
task :beautify do
  stores = get_stores

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

desc 'Make index for stores.js'
task :make_index do
  stores = get_stores
  count = stores.length
  province = stores[0].index("省份")
  city = stores[0].index("城市")
  stores = stores.transpose
  assoc = {}
  1.upto(count-1) do |index|
    _prov = stores[province][index]
    _city = stores[city][index]
    assoc[_prov] = [] unless assoc.has_key?(_prov)
    assoc[_prov] << _city unless assoc[_prov].include?(_city)
  end
  assoc.each_value do |a|
    a.sort! do |x,y|
      x.encode("GBK", "utf-8") <=> y.encode("GBK", "utf-8")
    end
  end
  puts "index ="
  assoc.keys.sort do |x,y|
    x.encode("GBK", "utf-8") <=> y.encode("GBK", "utf-8")
  end.each do |key|
    puts "  \"#{key}\": " + assoc[key].to_s
  end
end
