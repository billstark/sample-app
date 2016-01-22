module ApplicationHelper
	def full_title(page_title = '')
		base_title = "My ToDoList"
		if page_title.empty?
			base_title
		else 
			page_title + " | " + base_title
		end
	end

	def tag_name(task_id)
		Tag.find_by(id: task_id).name
	end
end
