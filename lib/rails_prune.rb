require "rails_prune/version"

module RailsPrune
  class Railtie < Rails::Railtie
    rake_tasks do
      load "rails_prune/task.rake"
    end
  end
end
