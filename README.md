# Chef Resource Inspector Markdown Generator

Generate markdown from cookbook resources to automate README documentation

Related: [Chef RFC 104: Self Documenting Resources](https://github.com/chef/chef-rfc/blob/master/rfc104-self-documenting-resources.md)

(Proof of concept)

Usage: 
- `mkdir ~/resource_markdown_test && cd ~/resource_markdown_test`
- `git clone git@github.com:gsreynolds/chef_resource_inspector_md chef_resource_inspector_md`
- `git clone git@github.com:sous-chefs/haproxy.git -b gsreynolds/resource_documentation haproxy`
- `chef exec ruby chef_resource_inspector_md/generate_resource_md.rb haproxy > RESOURCES.md`
- Inspect & replace Resources section in README.md
