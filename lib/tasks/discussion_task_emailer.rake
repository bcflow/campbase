namespace :discussion_task_emailer do

  desc "Send project summaries at the end of each day"
  task :discussions_and_tasks => :environment do

  Project.find_each do |project|
    user = project.user
    tasks = project.tasks.where("created_at >= :today", {today: Date.today.midnight})
    discussions = project.discussions.where("created_at >= :today", {today: Date.today.midnight})
    ProjectSummaryMailer.notify_project_owner_tasks(tasks, user).deliver_now if tasks.count > 0
    ProjectSummaryMailer.notify_project_owner_discussions(discussions, user).deliver_now if discussions.count > 0
  end

  end
  
end