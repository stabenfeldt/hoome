# TODO This does not work. Problem solved by removing v1 from all filenames, for now.

VersionCake.setup do |config|
  # Versioned Resources
  # Define what server resources are supported, deprecated or obsolete
  # Resources listed are priority based upon creation. To version all
  # resources you can define a catch all at the bottom of the block.
  config.resources do |r|
    # r.resource uri_regex, obsolete, deprecated, supported
    # r.resource %r{.*}, [], [], (1..5)
		r.resource %r{.*}, [], [], [1]
  end
	config.extraction_strategy = :http_header
	config.missing_version = 1

end
