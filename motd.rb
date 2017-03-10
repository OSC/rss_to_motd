# curl https://www.osc.edu/feeds/known-issues.xml | ruby motd.rb

require 'rss'

feed = RSS::Parser.parse(STDIN.read)
puts feed.inspect

# inline ERB template :-P or similar
