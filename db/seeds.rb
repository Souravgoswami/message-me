class ForkProcess
	require 'etc'
	FORK_PIDS = []
	PROCESSORS = Etc.nprocessors

	def self.fork(&block)
		if FORK_PIDS.count { |x| IO.read("/proc/#{x}/stat").split[2] != ?Z } < PROCESSORS * 4
			FORK_PIDS << Process.fork { block === self }
			break
		else
			sleep 0.001
			redo
		end while true
	end
end

# Create unique usernames
NAME = (?a..?y).to_a.permutation
ITEMS = 500

time = Time.now
ITEMS.times do |i|
	## Print count, elapsed time, just to monitor, nothing to do with ForkProcess...
	elap = Time.now - time
	est_rem = ITEMS.*(elap)./(i).-(elap).round(2)
	print "\e[2K#{i} | Elapsed #{elap.round(2)}s | Rem #{est_rem}s \r"

	## ForkProcess Code
	name = NAME.next.join.capitalize
	ForkProcess.fork { User.create!(username: name, password: 'randomuser') }
end
