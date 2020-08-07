cis_test_name="Ensure kernel module loading and unloading is collected (Scored)"
cis_test_pa=(server workstation)
cis_test_spl=2
cis_test_wpl=2

function cis_test_run()
{
    cmd=$(grep modules /etc/audit/rules.d/*.rules | md5sum)
    [ "$cmd" != "cd1e7a1cfc749edc93d35126060b0a42  -" ] && return 1
    cmd=$(auditctl -l | grep modules | md5sum)
    [ "$cmd" != "5fe80b2ba6323c886fe04ddfcb580f33  -" ] && return 1

    return 0
}