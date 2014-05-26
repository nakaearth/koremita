require 'spec_helper'

describe MovieRegister do
  let!(:current_user) { FactoryGirl.create(:current_user) }
  let!(:test_movie) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie2) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie3) { FactoryGirl.create(:test_movie, user: current_user) }
  let!(:test_movie4) { FactoryGirl.create(:test_movie, user: current_user) }
#  let!(:params) { movie: { title: 'test movie', image_utl: 'http://test.com/hoge.jpg',
#    description: 'test test test', rate: 100 },
#    youtub: { title: 'test youtub', url: 'http://hogehoge.jp/test.mp3'}
#  }

  describe "serviceは登録時にmovieテーブルとyoutubテーブルに値を入れる" do
    context "movieとyoubu両方登録" do
      before do
        service = MovieRegister.new(current_user)
        movie_params = { title: 'test movie', image_url: 'http://test.com/hoge.jpg',
                           description: 'test test test', rate: 100 }
        youtub_params =  { title: 'test youtub', url: 'http://hogehoge.jp/test.mp3'}
        service.regist_movie(movie_params, youtub_params)
      end
      it "登録されたmovieの数が増えている" do
        expect(current_user.movies.size).to eql(5)
      end
      it "登録されたmovieのデータを調べる" do
        movie = current_user.movies.last
        expect(movie.title).to eql('test movie')
        expect(movie.image_url).to eql('http://test.com/hoge.jpg')
        expect(movie.description).to eql('test test test')
        expect(movie.rate).to eql(100)
      end
      it "登録されたyoutubのデータを調べる" do
        movie = current_user.movies.last
        youtub = movie.youtub
        expect(youtub.title).to eql('test youtub')
      end
    end
  end
end
