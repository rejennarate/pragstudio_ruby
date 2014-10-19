Gem::Specification.new do |s|
  s.name         = "buttfaces_game"
  s.version      = "1.0.0"
  s.author       = "jenna hildebrand"
  s.email        = "jenna.hildebrand@gmail.com"
  s.homepage     = "https://github.com/rejennarate/pragstudio_ruby"
  s.summary      = "a game i made from a tutorial"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end