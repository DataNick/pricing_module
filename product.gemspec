lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "product"
  spec.version       = '1.0'
  spec.authors       = ["Your Name Here"]
  spec.email         = ["youremail@yourdomain.com"]
  spec.summary       = %q{Repackaging products based on category and number of people}
  spec.description   = %q{The module calculates prices based on categories of goods, the number of people involved and base-line cost of materials}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/product.rb']
  spec.executables   = ['bin/product']
  spec.test_files    = ['tests/test_product.rb']
  spec.require_paths = ["lib"]
end