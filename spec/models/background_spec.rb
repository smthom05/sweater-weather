require 'rails_helper'

describe Background do
  it 'exists' do
    location = 'denver,co'
    bg = Background.new(location)

    expect(bg).to be_a(Background)
  end

  it 'has gets a photo_url' do
    location = 'denver,co'
    bg = Background.new(location)

    expect(bg.photo_url).to be_a(String)
  end

end
