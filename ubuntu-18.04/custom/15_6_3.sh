cis_test_name="Ensure permissions on /root/.bashrc and /root/.profile are configured"
cis_test_pa=(server workstation)
cis_test_spl=1
cis_test_wpl=1

function cis_test_run()
{
	cmd=$(stat /root/.bashrc | grep 'Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: (    0/    root)')
	[ -z "$cmd" ] && return 1

	cmd=$(stat /root/.profile | grep 'Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: (    0/    root)')
	[ -z "$cmd" ] && return 1

	return 0
}