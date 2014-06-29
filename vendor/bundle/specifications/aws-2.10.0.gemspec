# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "aws"
  s.version = "2.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Reeder", "Chad Arimura", "RightScale"]
  s.date = "2014-04-01"
  s.description = "AWS Ruby Library for interfacing with Amazon Web Services including EC2, S3, SQS, SimpleDB and most of their other services as well. By http://www.appoxy.com"
  s.email = ["travis@appoxy.com"]
  s.homepage = "http://github.com/appoxy/aws/"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubygems_version = "2.0.14"
  s.summary = "AWS Ruby Library for interfacing with Amazon Web Services including EC2, S3, SQS, SimpleDB and most of their other services as well. By http://www.appoxy.com"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uuidtools>, [">= 0"])
      s.add_runtime_dependency(%q<xml-simple>, [">= 0"])
      s.add_runtime_dependency(%q<http_connection>, [">= 0"])
    else
      s.add_dependency(%q<uuidtools>, [">= 0"])
      s.add_dependency(%q<xml-simple>, [">= 0"])
      s.add_dependency(%q<http_connection>, [">= 0"])
    end
  else
    s.add_dependency(%q<uuidtools>, [">= 0"])
    s.add_dependency(%q<xml-simple>, [">= 0"])
    s.add_dependency(%q<http_connection>, [">= 0"])
  end
end
