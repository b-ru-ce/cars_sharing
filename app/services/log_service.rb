class LogService

	def self.log message, error
		p message

		if error
			p error.message
			p error.backtrace.join("\n")
		end
	end
end