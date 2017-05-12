require 'yamllint/rake_task'
require 'puppet-lint/tasks/puppet-lint'

YamlLint::RakeTask.new do |t|
    t.paths = %w(
        hieradata/**/*.yaml
        hiera.yaml
    )
end

task :rubylint do
	Dir['modules/**/*.rb','modules/**/*.erb'].each do |file|
		test = `ruby -c #{file}`
		if !$?.success?
			exit 1
		end
	end
end
