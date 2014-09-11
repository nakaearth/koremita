require 'rails_helper'
require 'api/itunes_search'

describe Api::ItunesSearch do

  describe "APIをたたいて映画情報がとれるか" do
    context "映画一覧を取得" do
      before do
        @api = Api::ItunesSearch.new('star', 'JP', 'movie')
        @result = @api.search
      end
      it { expect(@result).not_to be_nil }
    end
  end

end
