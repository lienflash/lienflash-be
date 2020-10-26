class WelcomeWorker 
  include Sidekiq::Worker

  def welcome_email(job)
    SendgridMailer.welcome_email(job).deliver_now
  end
end