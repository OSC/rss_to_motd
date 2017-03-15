#!/usr/bin/env ruby

# Usage:
#
# Pipe the content of an RSS feed to motd.rb. The resulting motd file will be
# output to stdout. Assumes that the RSS feed item descriptions are plain text.
#
# curl https://raw.githubusercontent.com/OSC/rss_to_motd/master/motd_rss_example.xml | ruby motd.rb > motd
#
# the future motd feed should be at https://www.osc.edu/feeds/motd.xml

require 'rss'
require 'erb'

welcome = <<-EOF
************************************************************************
Welcome to the Ohio Supercomputer Center!

PLEASE SEE THE OSC SUPERCOMPUTING DOCUMENTATION
FOR ANNOUNCEMENTS/NOTICES AND USER INFORMATION:
http://www.osc.edu/supercomputing

For questions or assistance, contact oschelp@osc.edu

To check for currently known issues, please visit
https://www.osc.edu/supercomputing/known-issues or follow @HPCNotices
on Twitter. 
************************************************************************
EOF

feed = RSS::Parser.parse(STDIN.read)
template = ERB.new "<%= item.pubDate.strftime('%Y/%m/%d') %>\n--- <%= item.title.upcase %>\n\n<%= item.description %>\n"
splitter = "************************************************************************\n"


puts welcome
puts feed.items.sort_by { |item| item.pubDate }.map { |item| template.result(binding) }.join(splitter)
puts splitter
