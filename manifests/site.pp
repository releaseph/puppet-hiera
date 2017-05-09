include stdlib

if $::ec2_tag_puppet_role {
    $puppet_role = $::ec2_tag_puppet_role
}

if $::ec2_tag_puppet_env {
    $puppet_env = $::ec2_tag_puppet_env
}

if $::is_virtual {
  if $::ec2_instance_id {
    $running_on = 'aws'
  } else {
    $running_on = $::virtual
  }
} else {
  $running_on = 'bare-metal'
}

hiera_include('classes',[])
node default {
  hiera_resources('resources',{})
}
