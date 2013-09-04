require "net/http"
require "uri"
require "json"

class AskGit
	def self.response_json url 
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		JSON.parse(response.body)
	end
end

class BlameMe
	
	def self.contributors user, repo 
		contributors = [] 
		contributors_json = AskGit.response_json "https://api.github.com/repos/#{user}/#{repo}/contributors"
		contributors_json.each do |contributor|
			contributors << contributor["login"]
		end
		contributors
	end

end


