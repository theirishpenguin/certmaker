Gem::Specification.new do |s|
  s.name        = 'certmaker'
  s.version     = '0.0.6'
  s.date        = '2012-07-11'
  s.summary     = "Make SSL Certs suitable for cloud platforms"
  s.description = "Easy way to make SSL Certs suitable for cloud platforms"
  s.authors     = ["Declan McGrath"]
  s.email       = 'declan@weuseopensource.com'
  s.files       = Dir.glob("{bin,samples}/**/*") + %w(LICENSE README.md history.txt)
  s.executables << 'certmaker'
  s.homepage    = 'http://rubygems.org/gems/certmaker'
end
