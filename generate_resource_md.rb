require 'chef/resource_inspector'
path = ARGV.first
resources = ResourceInspector.extract_cookbook(path, complete: false)

markdown = ''
markdown << "## Resources\n\n"
resources.each do |name, values|
  markdown << "### #{name}\n"
  markdown << "\n#{values[:description].strip}\n" if values[:description]
  markdown << "\nIntroduced: #{values[:introduced]}\n" if values[:introduced]
  markdown << "\n#### Actions\n"
  (values[:actions] - [:nothing]).each do |action|
    markdown << "\n- `:#{action}`"
    markdown << " (default)" if action == values[:default_action]
  end

  markdown << "\n\n#### Properties\n\n"
  common_properties = %i[name retries retry_delay sensitive ignore_failure]
  (values[:properties]).each do |property|
    next if common_properties.include?(property[:name])
    # "- `#{property[:name]}` - #{property[:description]} (is: #{property[:is]}, default: ``, introduced: #{property[:introduced]})"
    markdown << "- `#{property[:name]}` - "
    markdown << property[:description] if property[:description]
    markdown << " (is: #{property[:is]}"
    # defaults introduced to resource inspector in https://github.com/chef/chef/pull/7300
    markdown << ", `#{property[:default]}`" if property[:default]
    markdown << ", introduced: #{property[:introduced]}" if property[:introduced]
    markdown << ")\n"
  end

  if values[:examples]
    markdown << "\n#### Examples\n\n"
    markdown << values[:examples].strip
  end
  markdown << "\n"
end

puts markdown
