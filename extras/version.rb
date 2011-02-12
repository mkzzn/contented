module Version
  MAJOR = 0
  MINOR = 3
  MICRO = 11

  def self.print
    [ MAJOR, MINOR, MICRO ].join(".")
  end
end
