require 'open-uri'
require 'nokogiri'

namespace :crawler do
  desc '映画情報をクロールする'

  task latest_movies: :environment do
    logger = ActiveSupport::Logger.new('log/crawler.log')
    crawl 'http://eiga.com/now/'
    logger.info '最新映画取得開始'
  end

  private

  def crawl(url)
    # ここに処理を追記。
    charset = nil
    html = open(url) do |h|
      charset = h.charset
      h.read
    end
    doc = Nokogiri::HTML.parse html, nil, charset
    puts doc.title
  end
end
