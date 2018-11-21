FEDORA:

sudo modprobe {nfs,nfsd,rpcsec_gss_krb5}

sudo docker run --name nfs-server -d                                   \
  -v /home/chetanya95/nfs/docker-nfs-server/data:/data  \
  -v /home/chetanya95/nfs/docker-nfs-server/exports.txt:/etc/exports:ro        \
  --cap-add SYS_ADMIN                                 \
  -p 2049:2049        -p 2049:2049/udp                                \
  -p 111:111     -p 111:111/udp     \
  -p 32765:32765 -p 32765:32765/udp \
  -p 32767:32767 -p 32767:32767/udp \
  nfs-server-image


DEBIAN:

sudo modprobe {nfs,nfsd,rpcsec_gss_krb5}

sudo apt-get install apparmor-utils

sudo apparmor_parser -r -W /path/to/file/aa_profile

sudo docker run --name nfs-server -d                                   \
  -v /var/lib/jenkins/workspace/data:/data  \
  -v /home/drai96005/nfs-server/exports.txt:/etc/exports:ro        \
  --cap-add SYS_ADMIN --security-opt apparmor=erichough-nfs        \
  -p 2049:2049        -p 2049:2049/udp                                \
  -p 111:111     -p 111:111/udp     \
  -p 32765:32765 -p 32765:32765/udp \
  -p 32767:32767 -p 32767:32767/udp \
  nfs-server-image





mount <container-IP>:/some/export /some/local/path
