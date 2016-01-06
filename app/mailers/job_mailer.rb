class JobMailer < ApplicationMailer
  default from: 'Companion Server <companion@sanger.ac.uk>'

  def start_job_email(job)
    @url = jobs_url(:only_path => :true)
    @job = job
    mail(to: @job.email, subject: "Your job '#{job[:name]}' has started running")
  end

  def finish_success_job_email(job)
    @url = jobs_url(:only_path => :true)
    @job = job
    mail(to: @job.email, subject: "Your job '#{job[:name]}' has finished successfully")
  end

  def finish_failure_job_email(job)
    @url = jobs_url(:only_path => :true)
    @job = job
    mail(to: @job.email, subject: "Your job '#{job[:name]}' has failed")
  end

  def finish_failure_job_email_notify_dev(job)
    @url = jobs_url(:only_path => :true)
    @job = job
    mail(to: 'companion@sanger.ac.uk', subject: "User job '#{job[:name]}' (#{job[:job_id]}) has failed")
  end
end