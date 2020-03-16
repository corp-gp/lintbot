# frozen_string_literal: true

CHANGED_FILES = (git.added_files + git.modified_files).freeze
ADDED_FILES = git.added_files.freeze

Dir['/danger_rules/*.rb'].each do |danger_rule_file|
  danger_rule = danger_rule_file.gsub(%r{(^./.lintbot/|.rb)}, '')
  $stdout.print "- #{danger_rule} "
  eval File.read(danger_rule_file), binding, File.expand_path(danger_rule_file)
  $stdout.puts '✅'
rescue Exception => e
  $stdout.puts '💥'

  fail "Danger rule :#{danger_rule} failed with exception: #{e.message}\n" \
       "Backtrace: \n#{e.backtrace.join("\n")}"
end
