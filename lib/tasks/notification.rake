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

  desc "Send mail notification to managers each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
