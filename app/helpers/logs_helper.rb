module LogsHelper
  def grouped_tasks_options(slot)
    tasks = current_user.tasks.order(:name)
              .group_by { |t| t.project.name }
              .each_with_object({}) { |k, h| h[k.first] = k.last.collect { |t| [t.name, t.id] } }
    grouped_options_for_select tasks, slot.task_id
  end	
end
