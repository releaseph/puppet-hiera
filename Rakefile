require 'yamllint/rake_task'
require 'puppet-lint/tasks/puppet-lint'

YamlLint::RakeTask.new do |t|
    t.paths = %w(
        hieradata/**/*.yaml
        hiera.yaml
    )
end
