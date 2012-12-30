module CyclesHelper
  def reading_options
    [["Oral", 1],
     ["Rectal", 2],
     ["Vaginal", 3]]
  end

  def reading option
    reading_options.each { |a| return a[0] if a[1] == option } if option
  end

  def cycle_days day
    cycle = Cycle.find_by_user_and_date(current_user, day.date)
    return [] unless cycle
    #cycle.days.select(&:temperature).map { |d| {date: d.date.strftime('%F'), temperature: d.temperature} }
    cycle.days.select(&:temperature)
  end
end
