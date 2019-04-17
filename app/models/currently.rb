class Currently
  attr_reader :time,
              :summary,
              :precip_prob,
              :temperature,
              :humidity,
              :wind_speed,
              :visibility
  def initialize(weather_data)
    @time = weather_data[:time]
    @summary = weather_data[:summary]
    @precip_prob = weather_data[:precipProbability]
    @temperature = weather_data[:temperature]
    @humidity = weather_data[:humidity]
    @wind_speed = weather_data[:windSpeed]
    @visibility = weather_data[:visibility]
  end
end
