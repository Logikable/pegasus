module ProjectHelper

  def get_office_img(office)
    if office == "San Francisco" || office == "San Jose"
      return "america.svg"
    elsif office == "Shanghai"
      return "china.svg"
    elsif office == "Toronto"
      return "canada.svg"
    elsif office == "Amsterdam"
      return "netherlands.svg"
    else
      return ""
    end
  end

  def get_priority_color(priority)
    if priority == "High"
      return "#de350b"
    elsif priority == "Medium"
      return "#ff991f"
    else
      return "#57d9a3"
    end
  end
end
