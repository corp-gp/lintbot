# frozen_string_literal: true

# Check that the db/schema.rb is changed if migrations changed
updated_migrations_files = CHANGED_FILES.select { |path| path =~ %r{db/migrate} }
schema_updated = CHANGED_FILES.include?('db/structure.sql')

if updated_migrations_files.any? && !schema_updated
  warn "Please, check whether you need to update the db/schema.rb.\n" \
       "You have the following migrations updated or added:\n" \
       "#{gitlab.html_link(updated_migrations_files)}"
end
