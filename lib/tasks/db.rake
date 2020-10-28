namespace :db do
  desc "Update jobs nightly to check for late? status"
  task update_jobs: :environment do
    JobFacade.update_jobs
  end
end
