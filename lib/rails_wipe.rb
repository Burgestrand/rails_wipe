require "rails_wipe/version"

module RailsWipe
  class Railtie < Rails::Railtie
    rake_tasks do
      load "rails_wipe/task.rake"
    end
  end
end
