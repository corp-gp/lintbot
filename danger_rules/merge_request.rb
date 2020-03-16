# frozen_string_literal: true

if gitlab.mr_title.length > 72
  warn 'The title of this merge request is longer than 72 characters and ' \
    'would violate our commit message danger_rules when using the Squash on Merge ' \
    'feature. Please consider adjusting the title, or rebase the ' \
    "commits manually and don't use Squash on Merge."
end

if gitlab.mr_body.length < 2
  warn 'Please provide a summary in the Merge Request description to help your colleagues to understand the MR purpose.'
end

unless gitlab.mr_json['assignee']
  warn 'This merge request does not have any assignee yet. Setting an assignee clarifies who needs to take action on the merge request at any given time.'
end

if git.lines_of_code > 2_000
  warn "This merge request is definitely too big (more than #{git.lines_of_code} lines changed), please split it into multiple merge requests."
elsif git.lines_of_code > 500
  warn "This merge request is quite big  (more than #{git.lines_of_code} lines changed), please consider splitting it into multiple merge requests."
end

if gitlab.branch_for_merge != 'master'
  warn 'Most of the time, merge requests should target `master`.'
end

unless gitlab.mr_json['squash']
  warn 'Disabled squash commits when merge request is accepted.'
end
