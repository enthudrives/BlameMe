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

	def self.name login
		user_json = response_json "https://api.github.com/users/#{login}"
		user_json["name"]
	end
end


