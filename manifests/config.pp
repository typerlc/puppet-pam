
class pam::config {
	
	# Wish list: configure with augeas
	#if($module == 'ldap') {
	#	$databases = $pam::params::databases_ldap
	#} else {
	#	$databases = $pam::params::databases_none
	#}

	include pam::params

	case $::operatingsystem {
	
		debian:  {
			include pam::config::debian 
		}

		redhat:  {
			include pam::config::redhat
		}

		default: { 
			fail("Operating system ${::operatingsystem} not supported")
		}
	}

}
