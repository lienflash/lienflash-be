class UserNotifierMailer < ApplicationMailer

  def send_job_creation_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "You've created a new job using Lien Flash" )
  end

  def send_first_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash requires your attention" )
  end

  def send_second_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash requires your attention" )
  end

  def send_third_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash requires your attention" )
  end

  def send_fourth_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash requires your attention" )
  end

  def send_just_labor_first_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash requires your attention" )
  end

  def send_just_labor_second_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash requires your attention" )
  end

  def send_final_notice_email(job, user)
    @user = user
    @job = job
    mail( :to => @user.email,
    :subject => "A Job on Lien Flash desperately requires your attention" )
  end
end
