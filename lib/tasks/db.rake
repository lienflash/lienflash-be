namespace :db do
  desc "Update jobs nightly to check for late? status"
  task update_jobs: :environment do
    jobs = Job.all
    jobs.each do |job|
      job.status_update
    end
  end
end
