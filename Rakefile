require 'erb'

task :default => :install

desc "install the dot files into user's home directory"
task :install do
  files = Dir['*'] - %w(Rakefile README.md)
  files.reject! { |file| file.match(/.mylocal$/) }
  home = ENV['HOME']
  files.each do |file|
    destination = File.join home, ".#{file}"
    backup_original(file) if File.exist?(destination)

    if file.match(/\.erb$/)
      content = ERB.new(File.read(file)).result(binding)
      file = file.gsub(/\.erb$/, '.mylocal')
      destination_file = file.gsub(/\.mylocal$/, '')
      File.open(file, 'w') { |new_file| new_file.write content }
      link_file file, destination_file
    else
      link_file file
    end
  end
end

def link_file file, destination_file = nil
  destination_file ||= file
  %x{ln -s "$PWD/#{file}" "$HOME/.#{destination_file}"}
end

def backup_original file
  %x{mv "$HOME/.#{file}" "$HOME/.#{file}.backup"}
end

def ask(value)
  print "Enter value for #{value}: "
  $stdin.gets.chomp
end
