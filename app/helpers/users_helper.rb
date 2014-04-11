module UsersHelper

  def pretty_title_print
    num_titles = 0
    if user.is_researcher
      num_titles = num_titles + 1
    end
    if user.is_teacher
      num_titles = num_titles + 1
    end
    if user.is_student
      num_titles = num_titles + 1
    end
    if user.is_comm_member
      num_titles = num_titles + 1
    end



  end
end
