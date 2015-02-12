class ProjectSummaryMailer < ApplicationMailer
  
  def notify_project_owner_tasks(tasks, user)
    @tasks = tasks
    @user  = user
    mail to: @user.email, subject: "Your project tasks for #{Date.today}."
  end

  def notify_project_owner_discussions(discussions, user)
    @discussions = discussions
    @user  = user
    mail to: @user.email, subject: "Your discussion updates for #{Date.today}."
  end
  
end

