require 'chef/resource_inspector'
path = ARGV.first
resources = ResourceInspector.extract_cookbook(path, complete: false)

markdown = ''
markdown << '## Resources'
resources.each do |name, values|
  markdown << "\n\n### #{name}\n"
  markdown << "\n#{values[:description]}\n" if values[:description]
  markdown << "Introduced: #{values[:introduced]}\n" if values[:introduced]
  markdown << "\n#### Actions\n"
  (values[:actions] - [:nothing]).each do |action|
    markdown << "\n- `:#{action}`"
  end
  markdown << "\n\n#### Properties\n"
  common_properties = %i[name retries retry_delay sensitive ignore_failure]
  (values[:properties]).each do |property|
    next if common_properties.include?(property[:name])
    # "- `#{property[:name]}` - #{property[:description]} (is: #{property[:is]}, default: ``, introduced: #{property[:introduced]})"
    property_string = ''
    property_string << "\n- `#{property[:name]}` - "
    property_string << property[:description] if property[:description]
    property_string << " (is: #{property[:is]}"
    # FIXME: no default yet from resource inspector
    # property_string << ", `#{property[:default]}`" if property[:default]
    property_string << ", introduced: #{property[:introduced]}" if property[:introduced]
    property_string << ')'
    markdown << property_string
  end

  if values[:examples]
    markdown << "\n\n#### Examples\n\n"
    markdown << values[:examples]
  end
end

puts markdown
