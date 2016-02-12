Gem::Specification.new do |s|
  s.name        = 'meew'
  s.version     = '0.0.1'
  s.executables << 'meew'
  s.date        = '2016-02-12'
  s.summary     = 'Meeeeew!'
  s.description = 'A simple cat-friendly gem'

  s.authors     = ['Francesco Negri']
  s.email       = 'francesconegri@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/meew'
  s.license     = 'MIT'

  s.files       = ['lib/meew.rb',
                   'lib/meew/cat_images.rb',
                   'lib/meew/cat_facts.rb',
                   'lib/meew/tech_news.rb']

  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'camertron-moar-lolspeak', '= 0.0.2'

  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'webmock', '~> 1.22', '>= 1.22.6'
  s.add_development_dependency 'fakefs', '~> 0.8.0'
  s.add_development_dependency 'rake', '~> 10.5'
end
