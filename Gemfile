# frozen_string_literal: true

source "https://rubygems.org"
gem "inspec", git: "https://github.com/inspec/inspec", branch: "inspec-7"
gem "inspec-bin", git: "https://github.com/inspec/inspec", branch: "inspec-7"

group :test do
  gem "byebug"
  gem "chefstyle"
  gem "minitest"
  gem "m"
  gem "mocha"
  gem "rake"
  gem "simplecov"
  gem "simplecov_json_formatter"
  gem "mongo", "= 2.13.2" # 2.14 introduces a broken symlink in mongo-2.14.0/spec/support/ocsp
end
