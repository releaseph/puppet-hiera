include stdlib

if $::ec2_tag_puppet_role {
	$puppet_role = $::ec2_tag_puppet_role
}

hiera_include('classes',[])
node default {
  hiera_resources('resources',{})
}
