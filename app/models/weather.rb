class Weather
  
  attr_reader :forecast_dates, :forecast_days, :forecast_icons, :forcast_temps, :forcast_tips, 
    :weather_date, :weather_time, :weather_icon, :weather_degree, :weather_detail

  def initialize(city)
    city_map = {
      "贵阳" => "guiyang",
      "铜仁" => "guizhou_tongren",
      "遵义" => "zunyi",
      "凯里" => "kaili",
      "安顺" => "anshun",
      "都匀" => "duyun",
      "毕节" => "bijie",
      "兴义" => "xingyi"
    }
    @city_code = city_map[city.name]
  end

  def sina_weather
    url = "http://weather.sina.com.cn/#{@city_code}"
    params = {
      :headers => {
        "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
      }
    }
    response = HTTParty.get(url, params)
    @forecast_dates = Nokogiri::HTML(response.body).xpath("//*[@class='wt_fc_c0_i_date']").map(&:text)
    @forecast_days = Nokogiri::HTML(response.body).xpath("//*[contains(concat(' ', @class, ' '), ' wt_fc_c0_i_day ')]").map(&:text)
    @forecast_icons = Nokogiri::HTML(response.body).xpath("//*[@class='icons0_wt png24']").map do |node|
      node.get_attribute "src"
    end
    @forcast_temps = Nokogiri::HTML(response.body).xpath("//*[@class='wt_fc_c0_i_temp']").map(&:text)
    @forcast_tips = Nokogiri::HTML(response.body).xpath("//*[@class='wt_fc_c0_i_tip']").map(&:text)

    @weather_city = Nokogiri::HTML(response.body).xpath("//*[@class='slider_ct_name']")[0].text
    @weather_date = Nokogiri::HTML(response.body).xpath("//*[@class='slider_ct_date']")[0].text
    @weather_time = Nokogiri::HTML(response.body).xpath("//*[@class='slider_ct_time png24']")[0].text
    @weather_icon = Nokogiri::HTML(response.body).xpath("//*[@class='slider_whicon png24']")[0].get_attribute("src")
    @weather_degree = Nokogiri::HTML(response.body).xpath("//*[@class='slider_degree']")[0].text
    @weather_detail = Nokogiri::HTML(response.body).xpath("//*[@class='slider_detail']")[0].text.strip

    self
  end

end