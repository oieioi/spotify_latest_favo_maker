require_relative 'lib/spotify_latest_favo_maker/version'

Gem::Specification.new do |spec|
  spec.name          = "spotify_latest_favo_maker"
  spec.version       = SpotifyLatestFavoMaker::VERSION
  spec.authors       = ["oieioi"]
  spec.email         = ["atsuinatsu.samuifuyu@gmail.com"]

  spec.summary       = %q{Create latest favo playlist from your spotify }
  spec.description   = %q{Create latest favo playlist from your spotify }
  spec.homepage      = "https://github.com/oieioi"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/oieioi"
  spec.metadata["changelog_uri"] = "https://github.com/oieioi"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rspotify'
  spec.add_dependency 'dotenv'
end
