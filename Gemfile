source "https://rubygems.org"

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "github-pages", '203'
end

# enable tzinfo-data for local build
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'jekyll-paginate'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0", :install_if => Gem.win_platform?
