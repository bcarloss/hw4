require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This is perfect for development since you don't have to 
  # restart the web server when you make code changes.
  config.cache_classes = false
  config.eager_load = false

  # Show full error reports and enable server timing
  config.consider_all_requests_local = true
  config.server_timing = true

  # Enable/disable caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Print deprecation notices to the Rails logger and raise exceptions for disallowed deprecations.
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Configuration for the generators.
  config.generators do |generator|
    generator.helper false
    generator.assets false
    generator.test_framework nil
  end
  
  # Configure permitted hosts
  config.hosts.clear
  
  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered views with file names
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Allow Action Cable requests from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  
  # Avoid 'Cannot render console' message in Gitpod
  config.web_console.whiny_requests = false

  # Define the Active Storage service
  config.active_storage.service = :local
end

