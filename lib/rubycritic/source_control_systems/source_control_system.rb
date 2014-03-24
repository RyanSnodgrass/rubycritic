module Rubycritic

  class SourceControlSystem
    @@systems = []

    def self.register_system
      @@systems << self
    end

    def self.create
      supported_system = systems.detect(&:supported?)
      if supported_system
        supported_system.new
      else
        raise "Rubycritic requires a #{system_names} repository."
      end
    end

    def self.systems
      @@systems
    end

    def self.system_names
      systems.join(", ")
    end
  end

end

require "rubycritic/source_control_systems/git"