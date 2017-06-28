namespace :notification do
  desc "Send sms to ask employees to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5pm
    # 2. Iterate over all employees except admin users
    # 3. Send a message including instructions and a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end
end
