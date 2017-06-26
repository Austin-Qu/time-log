module SmsTool
  def self.send_sms(num:, msg:)
    # required keyword arguments Ruby 2.1
    puts "#{msg} to #{num}"
  end
end
