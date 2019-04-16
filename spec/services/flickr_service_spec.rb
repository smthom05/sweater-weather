require 'rails_helper'

describe 'Flickr Service' do
  it 'exists' do
    fs = FlickrService.new

    expect(fs).to be_a(FlickrService)
  end

  it 'returns an image' do
    

  end

end
