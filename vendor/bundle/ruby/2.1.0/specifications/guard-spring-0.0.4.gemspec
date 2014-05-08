# -*- encoding: utf-8 -*-
# stub: guard-spring 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "guard-spring"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Micha\u{142} Knapik"]
  s.date = "2013-08-14"
  s.description = "Guard::Spring automatically runs tests with spring"
  s.email = ["mknapik@student.agh.edu.pl"]
  s.homepage = "https://github.com/mknapik/guard-spring"
  s.rubygems_version = "2.2.2"
  s.summary = "Pushes watched files to spring"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 0"])
      s.add_runtime_dependency(%q<spring>, [">= 0"])
    else
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<spring>, [">= 0"])
    end
  else
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<spring>, [">= 0"])
  end
end
