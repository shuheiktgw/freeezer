
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "freeezer/version"

Gem::Specification.new do |spec|
  spec.name          = "freeezer"
  spec.version       = Freeezer::VERSION
  spec.authors       = ["Shuhei Kitagawa"]
  spec.email         = ["shuhei.kitagawa@c-fo.com"]

  spec.summary       = %q{freeezer is a gem to deep freeze each value of Array and Hash}
  spec.description   = %q{freeezer is a gem to deep freeze each value of Array and Hash}
  spec.homepage      = 'https://github.com/shuheiktgw/freeezer'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
