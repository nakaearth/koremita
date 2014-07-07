require 'spec_helper'
require 'api/youtube'

describe Api::Youtube do

  describe "映画情報を取得するクラス" do
    context "search_movieを正常ケースで実行した場合" do
      before do
        @api = Api::Youtube.new
        @result = @api.search_movie('star', 1, 10)
        @result.videos.each do |video|
          p video
        end
      end
      it "starというキーワドに関連する映画の情報が取れる" do
        expect(@result).not_to be_nil
      end
    end
  end
end
