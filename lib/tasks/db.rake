namespace :db do
  desc "Update jobs nightly to check for late? status"
  task update_jobs: :environment do
    JobsFacade.update_jobs
  end
end
