require 'rails_helper'

describe 'Flickr Service' do
  it 'exists' do
    location_data = {lat: 39.7392, lng: -104.9903}
    fs = FlickrService.new(location_data)

    expect(fs).to be_a(FlickrService)
  end

  it 'returns an image' do
    location_data = {lat: 39.7392, lng: -104.9903}
    fs = FlickrService.new(location_data)

    photo_data = fs.get_photo

    expect(photo_data).to be_a(Hash)
    expect(photo_data).to have_key('id')
    expect(photo_data).to have_key('owner')
    expect(photo_data).to have_key('secret')
    expect(photo_data).to have_key('server')
    expect(photo_data).to have_key('farm')
    expect(photo_data).to have_key('title')
  end

end
