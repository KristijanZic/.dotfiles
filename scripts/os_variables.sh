linuxOsReleaseFile="/etc/os-release"
test -f $linuxOsReleaseFile && source $linuxOsReleaseFile

fedoraOsReleaseFile="/usr/lib/os-release"
test -f $fedoraOsReleaseFile && source $fedoraOsReleaseFile
