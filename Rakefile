require 'rake/clean'
CLEAN.include('*.o')
CLOBBER.include('test.exe')

HDRS = FileList['*.h']
SRC = FileList['*.c','*.cpp']
OBJ = SRC.ext('o')

# Rule to build .obj files from .cpp files
rule '.o' => ['.cpp'] do |t|
  sh "g++ -c #{t.source} -o #{t.name}"
end

file 'test.exe' do |t|
  sh "g++ -o #{t} main.o mod.o"
end 

desc "Default: Build the test executable"
task :default => [:build]

desc "Build the test executable"
task :build=>['test.exe']

# File dependencies
file 'main.o' => ['main.cpp'] + HDRS
file 'test.exe' => OBJ

# Generate cpp file dependencies
dependency_list = SRC.map{|l| `g++ -M -MM #{l}`.split("\n")}.flatten.map{|l| l.chomp}
lines = dependency_list.map{|l| l.split(":")}.map{|(obj, deps_str)| {:obj => obj, :dep => deps_str.split}}
lines.each do |dep_map|
  file dep_map[:obj] => dep_map[:dep]  
end

