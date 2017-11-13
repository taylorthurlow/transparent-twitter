guard 'livereload' do
  watch(%r{app/views/(.*)\//.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/(.*)\//.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{test/.+\.(js)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

guard :minitest, all_on_start: false, env: { 'NO_COVERAGE' => 'true' } do
  watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| "test/#{m[1]}test_#{m[2]}.rb" }

  # Rails 4
  watch(%r{^app/controllers/(.+)\.rb}) { |m| "test/controllers/#{m[1]}_test.rb" }
  watch(%r{^app/services/(.+)\.rb}) { |m| "test/services/#{m[1]}_test.rb" }
  watch(%r{^app/jobs/(.+)\.rb}) { |m| "test/jobs/#{m[1]}_test.rb" }
  watch(%r{^app/views/(.+)\.rb}) { |m| "test/controllers/#{m[1]}_test.rb" }
  watch(%r{^app/models/(.+)\.rb}) { |m| "test/models/#{m[1]}_test.rb" }
end
