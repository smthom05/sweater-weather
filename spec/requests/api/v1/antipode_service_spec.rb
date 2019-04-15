require 'rails_helper'

describe 'Antipode Service' do
  it 'will return the inputted citys antipode' do

    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful

  end
end
