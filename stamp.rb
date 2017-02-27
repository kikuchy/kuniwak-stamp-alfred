require 'json'
require 'pathname'

query = ARGV[0]

print JSON.generate({
  :items => Dir.glob("./stamp/images/*.png").map {|path|
    pn = Pathname(path)
    {
      :title => pn.basename(suffix = ".png"),
      :arg => pn.basename(suffix = ".png"),
      :uid => pn,
      :icon => {
        :path => pn.to_s
      }
    }
  }
})
