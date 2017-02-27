require 'net/http'
require 'uri'
require 'json'

query = ARGV[0]

print JSON.generate({
  :items => JSON.parse(Net::HTTP.get(URI.parse("https://api.github.com/repos/Kuniwak/stamp/git/trees/f63fa09c62af9e1bc2ffecd6edeedea477bf2912")))["tree"].map {|stamp|
    {
      :title => stamp["path"].split(".")[0],
      :arg => stamp["path"].split(".")[0],
      :uid => stamp["sha"],
      :icon => {
        :path => stamp["url"]
      }
    }
  }
})
