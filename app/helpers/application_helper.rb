module ApplicationHelper

    def get_array(string)
        str = string[1..-2]
        str.gsub('"', '').split(",")
    end

    def format_currency(number)
        number_to_currency(number, unit: "₱ ", separator: ".", delimiter: ",").to_s
    end

    def format_date(timestamp)
          date = Time.at(timestamp).to_datetime
          date.strftime('%d %b %Y  %I:%M %p')
    end
      
end
