class JobFacade
  def update_jobs
    jobs = Job.all
    jobs.map do |job|
      job.status_update
      job.notifications
    end
    jobs
  end
end
