def correct_solidus
  # Match solidus pointing to a local version. (Not github or gem)
  system("grep solidus Gemfile | grep -v '#' | grep path")
end

raise "Remember to point Gemfile to the local version of Solidus" unless correct_solidus or Rails.env.production?
