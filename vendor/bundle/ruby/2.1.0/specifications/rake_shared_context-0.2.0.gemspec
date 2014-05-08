# -*- encoding: utf-8 -*-
# stub: rake_shared_context 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rake_shared_context"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["willnet"]
  s.date = "2013-11-06"
  s.description = "shared_context for rake task"
  s.email = ["netwillnet@gmail.com"]
  s.homepage = "https://github.com/willnet/rake_shared_context"
  s.rubygems_version = "2.2.2"
  s.summary = "shared_context for rake task"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end