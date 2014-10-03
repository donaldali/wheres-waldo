module ScoresHelper
  def format_time time
    seconds = time % 60
    minutes = (time / 60) % 60
    hours = time / (60 * 60)

    format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
