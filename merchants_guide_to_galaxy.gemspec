Gem::Specification.new do |s|
  s.name = "merchants_guide_to_galaxy"
  s.version = "0.0.1"
  s.authors = ["Sarat Kongara"]
  s.date = Time.now.strftime('%Y-%m-%d')
  s.description = 'Calculator to convert numbers and units for intergalactic transactions that follow similar convention to the roman numerals.'
  s.summary = 'This project uses the hexagonal a.k.a ports and adapters architecture.
               This gem implements the application and domain layers in the hexagonal architecture.
               The application layer provides an API for the clients to invoke the functionality implemented in the domain layer.
               The domain layer implements code to capture the concepts in the business domain.'
  s.email = 'sarat.kongara@invilogic.com'
  s.homepage = 'http://www.invilogic.com'
  s.has_rdoc = false

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.platform      = Gem::Platform::RUBY

  s.add_development_dependency('rubocop', '=0.18.1')
  s.add_development_dependency('minitest', '=5.1.0')
  s.add_development_dependency('minitest-reporters', '=1.0.0')
  s.add_development_dependency('json', '=1.8.1')
  s.add_development_dependency('simplecov', '=0.8.2')

  s.license = 'MIT'
end
