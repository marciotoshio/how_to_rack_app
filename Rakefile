namespace :db do
  require "sequel"

  desc "Create database"
  task :create do
    Sequel.connect(ENV['DATABASE_URL'].rpartition('/').first) do |db|
      db.execute "CREATE DATABASE #{ENV['DATABASE_URL'].rpartition('/').last};"
    end
  end

  desc "Drop database"
  task :drop do
    Sequel.connect(ENV['DATABASE_URL'].rpartition('/').first) do |db|
      db.execute "DROP DATABASE #{ENV['DATABASE_URL'].rpartition('/').last};"
    end
  end

  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV['DATABASE_URL']) do |db|
      Sequel::Migrator.run(db, "db/migrations", target: version)
    end
  end
end
