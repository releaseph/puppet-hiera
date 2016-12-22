include stdlib

if $::ec2_tag_role {
	$role = $::ec2_tag_role
}

hiera_include('classes',[])
node default {
  hiera_resources('resources',{})
}
