def correct_solidus
  # Match solidus pointing to a local version. (Not github or gem)
  system("ack solidus Gemfile | ack -v '#' | ack path")
end

raise "Remember to point Gemfile to the local version of Solidus" unless correct_solidus or Rails.env.production?
