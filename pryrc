def gem_available?(name)
	Gem::Specification.find_by_name(name)
rescue Gem::LoadError
	false
rescue
	Gem.available?(name)
end

if gem_available?("awesome_print")
	require "awesome_print"
	AwesomePrint.pry!
end

Pry.config.theme = "tomorrow-night"
