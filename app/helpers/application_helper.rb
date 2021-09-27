module ApplicationHelper
  def is_buzzed?(buzzed, first_user_id)
    result = buzzed && first_user_id == current_user.id
    p "buzzed for #{current_user.id}" if result
    return result
  end

  def is_locked?(buzzed, first_user_id)
    result = buzzed && first_user_id != current_user.id
    p "locked for #{current_user.id}" if result
    return result
  end

  def buzzer_text(buzzed, first_user_id)
    if is_buzzed?(buzzed, first_user_id)
      return "buzzed"
    elsif is_locked?(buzzed, first_user_id)
      return "locked"
    else
      return "buzz"
    end
  end
end
