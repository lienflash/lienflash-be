class JobFacade
  def update_jobs
    jobs = Job.all
    jobs.each do |job|
      job.status_update
    end
  end 
end
