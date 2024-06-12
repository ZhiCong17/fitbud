class YoutubeService
  include HTTParty
  base_uri 'https://www.googleapis.com/youtube/v3'
  @api_key = ENV["YOUTUBE_API_KEY"]


  def self.search_videos(query)
    options = {
      query: {
        part: 'snippet',
        q: query,
        key: @api_key,
        maxResults: 1,
        type: 'video',
        videoDuration: 'short'
      }
    }
    response = HTTParty.get("#{base_uri}/search", options)
    video_id = response.parsed_response['items'][0]['id']['videoId']
  end
end
