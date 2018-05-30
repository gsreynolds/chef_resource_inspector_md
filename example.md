## Resources

### haproxy_acl

Backend describes a set of servers to which the proxy will connect to forward incoming connections.

Introduced: v4.0.0

#### Actions

- `:create`

#### Properties

- `acl` -  (is: [String, Array])
- `section` -  (is: String)
- `section_name` -  (is: String)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

#### Examples

```
haproxy_acl 'acls for frontend:http' do
  section 'frontend'
  section_name 'http'
  acl [
    'rrhost_host hdr(host) -i dave.foo.bar.com foo.foo.com',
    'tile_host hdr(host) -i dough.foo.bar.com',
  ]
end
```
```
haproxy_acl 'acls for listen' do
  section 'listen'
  section_name 'admin'
  acl ['network_allowed src 127.0.0.1']
end
```
```
haproxy_acl 'restricted_page path_beg /' do
  section 'listen'
  section_name 'admin'
end
```
### haproxy_backend

Backend describes a set of servers to which the proxy will connect to forward incoming connections.

Introduced: v4.0.0

#### Actions

- `:create`

#### Properties

- `mode` -  (is: String)
- `server` -  (is: Array)
- `tcp_request` -  (is: Array)
- `acl` -  (is: Array)
- `option` -  (is: Array)
- `extra_options` -  (is: Hash)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

### haproxy_config_defaults

Defaults sets default parameters for all other sections following
its declaration. Those default parameters are reset by the next "defaults"
section. See below for the list of parameters which can be set in a "defaults"
section. The name is optional but its use is encouraged for better readability.

Introduced: v4.0.0

#### Actions

- `:create`

#### Properties

- `timeout` -  (is: Hash)
- `log` -  (is: String)
- `mode` -  (is: String)
- `balance` -  (is: )
- `option` -  (is: Array)
- `stats` -  (is: Hash)
- `maxconn` -  (is: Integer)
- `extra_options` -  (is: Hash)
- `haproxy_retries` -  (is: Integer)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

### haproxy_config_global

#### Actions

- `:create`

#### Properties

- `haproxy_user` -  (is: String)
- `haproxy_group` -  (is: String)
- `pidfile` -  (is: String)
- `log` -  (is: [String, Array])
- `daemon` -  (is: [TrueClass, FalseClass])
- `debug_option` -  (is: String)
- `stats` -  (is: Hash)
- `maxconn` -  (is: Integer)
- `config_cookbook` -  (is: String)
- `chroot` -  (is: String)
- `log_tag` -  (is: String)
- `tuning` -  (is: Hash)
- `extra_options` -  (is: Hash)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

### haproxy_frontend

Frontend describes a set of listening sockets accepting client connections.

Introduced: v4.0.0

#### Actions

- `:create`

#### Properties

- `bind` -  (is: [String, Hash])
- `mode` -  (is: String)
- `maxconn` -  (is: Integer)
- `default_backend` -  (is: String)
- `use_backend` -  (is: Array)
- `acl` -  (is: Array)
- `option` -  (is: Array)
- `stats` -  (is: Hash)
- `extra_options` -  (is: Hash)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

#### Examples

```
haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

haproxy_frontend 'tcp-in' do
  mode 'tcp'
  bind '*:3307'
  default_backend 'tcp-servers'
end
```
### haproxy_install

#### Actions

- `:create`

#### Properties

- `install_type` -  (is: String)
- `conf_template_source` -  (is: String)
- `conf_cookbook` -  (is: String)
- `conf_file_mode` -  (is: String)
- `bin_prefix` -  (is: String)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)
- `haproxy_user` -  (is: String)
- `haproxy_group` -  (is: String)
- `install_only` -  (is: [true, false])
- `service_name` -  (is: String)
- `use_systemd` -  (is: String)
- `package_name` -  (is: String)
- `package_version` -  (is: [String, nil])
- `source_version` -  (is: String)
- `source_url` -  (is: String)
- `source_checksum` -  (is: String)
- `source_target_cpu` -  (is: [String, nil])
- `source_target_arch` -  (is: [String, nil])
- `source_target_os` -  (is: String)
- `use_pcre` -  (is: String)
- `use_openssl` -  (is: String)
- `use_zlib` -  (is: String)
- `use_linux_tproxy` -  (is: String)
- `use_linux_splice` -  (is: String)

### haproxy_listen

Listen defines a complete proxy with its frontend and backend parts combined in one section. It is generally useful for TCP-only traffic.

Introduced: v4.0.0

#### Actions

- `:create`

#### Properties

- `mode` -  (is: String)
- `bind` -  (is: [String, Hash])
- `maxconn` -  (is: Integer)
- `stats` -  (is: Hash)
- `http_request` -  (is: String)
- `http_response` -  (is: String)
- `default_backend` -  (is: String)
- `use_backend` -  (is: Array)
- `acl` -  (is: Array)
- `extra_options` -  (is: Hash)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

### haproxy_resolver

#### Actions

- `:create`

#### Properties

- `nameserver` -  (is: Array)
- `extra_options` -  (is: Hash)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

### haproxy_service

#### Actions

- `:create`
- `:start`
- `:stop`
- `:restart`
- `:reload`
- `:enable`

#### Properties

- `bin_prefix` -  (is: String)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)
- `haproxy_user` -  (is: String)
- `haproxy_group` -  (is: String)
- `service_name` -  (is: String)
- `source_version` -  (is: String)
- `use_systemd` -  (is: String)

### haproxy_use_backend

#### Actions

- `:create`

#### Properties

- `use_backend` -  (is: [String, Array])
- `section` -  (is: String)
- `section_name` -  (is: String)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

### haproxy_userlist

#### Actions

- `:create`

#### Properties

- `group` -  (is: Hash)
- `user` -  (is: Hash)
- `config_dir` -  (is: String)
- `config_file` -  (is: String)

