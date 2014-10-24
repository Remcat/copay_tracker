module ApplicationHelper
  def random_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end

  def random_date from = Date.new(1970), to = Time.now.to_date
    rand(from..to)
  end
end
