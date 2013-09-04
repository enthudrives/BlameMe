require 'ask_git'

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


