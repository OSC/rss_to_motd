# rss_to_motd

Example script to convert an rss feed of motd messages into an /etc/motd file

Tested to work with both Ruby 1.8.7 and Ruby 2.0.0 though the tests only run with Ruby 2+ (because of using minitest). The Rakefile is only necessarily to faciliate running the automated test.

## Usage

To produce an MOTD, if there was an motd.xml feed where the **RSS item descriptions are in plain text** (the same markdown compatible text that is currently used for description in MOTDs):

```sh
curl https://www.osc.edu/feeds/motd.xml | ruby motd.rb > motd
```

For example, you can do this right now with the example xml feed:

```sh
curl https://raw.githubusercontent.com/OSC/rss_to_motd/master/motd_rss_example.xml | ruby motd.rb > motd
```

1. [motd_expected](https://github.com/OSC/rss_to_motd/blob/master/motd_expected) is an example MOTD file
2. [motd_rss_example.xml](https://github.com/OSC/rss_to_motd/blob/master/motd_rss_example.xml) is an example corresponding RSS feed

The command converts the RSS feed into the example MOTD file.
