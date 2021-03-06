require 'cms/module_installation'

class BcmsMobile::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__

  # Add migrations to be copied, by uncommenting the following file and editing as needed.
  # copy_migration_file 'DATESTAMP_create_name_of_content_block.rb'

  def make_mobile_templates_directory
    empty_directory 'app/views/layouts/mobile'
  end
end
