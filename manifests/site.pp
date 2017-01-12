include stdlib

if $::ec2_tag_puppet_role {
	$puppet_role = $::ec2_tag_puppet_role
}

if $::ec2_tag_puppet_env {
	$puppet_env = $::ec2_tag_puppet_env
}

hiera_include('classes',[])
node default {
  $resources = hiera('resources')
  create_resources('resources', $resources)
}
