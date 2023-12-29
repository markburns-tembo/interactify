# frozen_string_literal: true

require_relative "lib/interactify/version"

Gem::Specification.new do |spec|
  spec.name = "interactify"
  spec.version = Interactify::VERSION
  spec.authors = ["Mark Burns"]
  spec.email = ["markburns@users.noreply.github.com"]

  spec.summary = "Interactors with bells and whistles"

  spec.description = <<~SPEC
    Adds the following to your interactor chains
      - lambda support
      - iteration
      - conditionals
      - verify expectations in chains. never again expect something not previously expected or promised
      - autogenerated async sidekiq job classes. Just append `::Async` to your interactor class name to add a job to sidekiq
      - everything can be an organizer or an interactor
  SPEC

  spec.homepage = "https://github.com/markburns/interactify"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/markburns/interactify"
  spec.metadata["changelog_uri"] = "https://github.com/markburns/interactify/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "interactor"
  spec.add_dependency "interactor-contracts"
  spec.add_dependency "rails"
  spec.add_dependency "sidekiq"
  spec.add_development_dependency "debug"
  spec.metadata["rubygems_mfa_required"] = "true"
end
