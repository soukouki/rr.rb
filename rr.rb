require "pp"

line = 1
i = nil
bin = binding

ARGV.each{|path|
	puts "require "+path
	puts "=> "+(require path).to_s
}

loop{
	print "> "
	i = $stdin.gets.chomp
	break if i=="\x04"
	begin
		pp eval(i, bin, "(repl)", line)
	rescue StandardError, LoadError => e
		puts e.class
		puts e
	end
	line += 1
}
