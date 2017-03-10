# curl https://www.osc.edu/feeds/known-issues.xml | ruby motd.rb

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
template = ERB.new "<%= item.pubDate.strftime('%Y/%m/%d') %>\n--- <%= item.title %>\n\n<%= item.description %>\n"
splitter = "************************************************************************\n"


puts welcome
puts feed.items.map { |item| template.result(binding) }.join(splitter)
