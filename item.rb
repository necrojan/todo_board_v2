class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  def initialize(title, deadline, description)
    raise 'Deadline is not a valid date' unless Item.valid_date?(deadline)

    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def self.valid_date?(date_str)
    date_arr = date_str.split('-').map(&:to_i)

    return false unless date_arr.length == 3
    return false unless date_arr[1].between?(1, 12)
    return false unless date_arr[2].between?(1, 31)

    true
  end

  def deadline=(new_deadline)
    raise 'deadline not valid' unless Item.valid_date?(new_deadline)

    @deadline = new_deadline
  end

  def toggle
    @done = !@done
  end
end
