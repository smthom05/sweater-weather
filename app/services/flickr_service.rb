class FlickrService
    attr_reader :lat,
                :lng

  def initialize(location_data)
    @lat = location_data[:lat]
    @lng = location_data[:lng]
  end

  def get_photo
    response = conn.get
    Hash.from_xml(response.body)['rsp']['photos']['photo'][0]
  end

  private


  def conn
    Faraday.new(url: "https://api.flickr.com/services/rest/") do |f|
      f.adapter Faraday.default_adapter
      f.params['api_key'] = ENV['FLICKR_KEY']
      f.params[:safe_search] = 1
      f.params[:content_type] = 1
      f.params[:method] = 'flickr.photos.search'
      f.params[:tag] = 'skyline,capitol'
      f.params[:lat] = @lat
      f.params[:lon] = @lng
      f.params[:radius] = 32
    end
  end
end
