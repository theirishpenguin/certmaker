Gem::Specification.new do |s|
  s.name        = 'certmaker'
  s.version     = '0.0.1'
  s.date        = '2011-11-18'
  s.summary     = "Make SSL Certs suitable for cloud platforms"
  s.description = "Easy way to make SSL Certs suitable for cloud platforms"
  s.authors     = ["Declan McGrath"]
  s.email       = 'declan@toothsuite.com'
  s.files       = Dir.glob("{bin,samples}/**/*") + %w(LICENSE README.md)
  s.executables << 'certmaker'
  s.homepage    = 'http://rubygems.org/gems/certmaker'
end
