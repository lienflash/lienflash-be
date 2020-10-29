class JobFacade

  def update_jobs(jobs)
    # jobs = Job.all
    jobs.map do |job|
      job.status_update

      binding.pry
      # job.save
      # job.update_attributes
    end
    jobs
    # Job.update_all
  end
end
