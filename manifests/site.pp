include stdlib
hiera_include('classes',[])
node default {
  hiera_resources('resources',{})
}
