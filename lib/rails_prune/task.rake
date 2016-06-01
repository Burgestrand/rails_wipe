namespace :prune do
  desc "An overridable environment for rails_prune gem"
  task environment: [:environment] do
    abort "[ERROR] Cannot prune #{Rails.env} environment." if Rails.env.production?
  end
end

namespace :db do
  desc "Truncate the database (from rails_prune gem)"
  task prune: ["prune:environment"] do
    Rails.application.eager_load!

    connection = ActiveRecord::Base.connection
    quoted_table_names = (ActiveRecord::Base.descendants - [ActiveRecord::SchemaMigration]).map(&:quoted_table_name)

    connection.execute("TRUNCATE TABLE #{quoted_table_names.join(",")} CASCADE")
  end
end
