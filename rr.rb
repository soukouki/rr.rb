require "pp"

line = 1
i = nil
bin = binding


def self.p *args, prefix: " p "
	args = args.first if args.length <= 1
	
	str = PP.pp(args, "##{prefix}=> ", 140)
	first, *other = str.lines
	puts first
	puts other.map{|s|"##{prefix}   #{s}"}
end


ARGV.each{|path|
	puts "require "+path
	puts "=> "+(require path).to_s
}

puts "Please input and push enter key."

loop do
	i = $stdin.gets.chomp
	break if i=="\x04"
	begin
		start_time = Time.now
		result = eval(i, bin, "(repl)", line)
		finish_time = Time.now
		p result, prefix: ""
		elapsed_time = finish_time-start_time
		if elapsed_time > 5
			putc "\a"
			puts "# elapsed time: "+
				elapsed_time.truncate(2).to_s.ljust(Math.log10(elapsed_time).to_i+4, "0")
		end
	rescue Exception => e
		puts e.inspect.lines.map{|s|"# #{s}"}
	end
	line += 1
end
