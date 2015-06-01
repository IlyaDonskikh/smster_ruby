Gem::Specification.new do |s|
  s.name        = 'smster_ruby'
  s.version     = '0.0.1'
  s.date        = '2015-06-01'
  s.authors     = ["doniv"]
  s.email       = ["donivrecord@gmail.com"]
  s.homepage    = "https://github.com/IlyaDonskikh/smster_ruby"
  s.summary     = "SMS service"
  s.description = "SMS sending service through different providers with maximum convenience."
  s.license     = "MIT"

  s.files = Dir["{lib, config}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end