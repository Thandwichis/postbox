module ApplicationHelper
    def humanize_seconds(seconds)
      [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map do |count, name|
        if seconds > 0
          seconds, n = seconds.divmod(count)
          "#{n.to_i} #{name}" unless n.to_i == 0
        end
      end.compact.reverse.join(' ')
    end
  end
  