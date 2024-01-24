FROM vbatts/slackware:15.0

# Set the local mirror
# sed -i '/^# https:\/\/mirrors\.slackware\.com\/slackware\/slackware64-15\.0\// s/^# //' test.list

RUN echo 'Y' | slackpkg install gcc && \
echo 'Y' | slackpkg install make && \
echo 'Y' | slackpkg install binutils && \
echo 'Y' | slackpkg install kernel-headers && \
echo 'Y' | slackpkg install glibc && \
echo 'Y' | slackpkg install guile

RUN echo 'Y' | slackpkg install gc && \
echo 'Y' | slackpkg install automake && \
echo 'Y' | slackpkg install autoconf && \
echo 'Y' | slackpkg install m4 && \
echo 'Y' | slackpkg install zlib && \
echo 'Y' | slackpkg install krb5 && \
echo 'Y' | slackpkg install libproxy && \
echo 'Y' | slackpkg install expat

# DavFS Build
RUN echo 'Y' | slackpkg install neon
RUN groupadd -g 230 davfs2 && \
useradd -u 230 -d /var/cache/davfs2 -g davfs2 -s /bin/false davfs2

WORKDIR /root
RUN wget --no-check-certificate 'https://slackbuilds.org/slackbuilds/15.0/system/davfs2.tar.gz'
RUN tar zxf davfs2.tar.gz
WORKDIR /root/davfs2
RUN wget 'http://ftp.cc.uoc.gr/mirrors/nongnu.org/davfs2/davfs2-1.6.1.tar.gz'
RUN chmod +x davfs2.SlackBuild && mkdir /root/build/ && export TAG='-GG' PKGTYPE=txz OUTPUT=/root/build && ./davfs2.SlackBuild

ENTRYPOINT [ "sh" ]

# installpkg /root/build/davfs2-1.6.1-x86_64-1-GG.txz


#RUN pwd
#RUN wget 'http://ftp.cc.uoc.gr/mirrors/nongnu.org/davfs2/davfs2-1.6.1.tar.gz'
#RUN chmod +x davfs2.SlackBuild && ./davfs2.SlackBuild



 # /tmp/davfs2-1.6.1-x86_64-1_SBo.tgz





# # Upgrade
# slackpkg update && slackpkg show-changelog
# slackpkg install-new
# slackpkg upgrade-all
# slackpkg clean-system

# run parts
# update-ca-certificates
# slackpkg install sysvinit-scripts


# sed # https://mirrors.slackware.com/slackware/slackware64-15.0/

# upgradepkg --install-new --reinstall

#echo 'Y' | slackpkg install pkg-tools && \
# echo 'Y' | slackpkg install glibc && \
# echo 'Y' | slackpkg install guile && \
# echo 'Y' | slackpkg install gc && \
# echo 'Y' | slackpkg install automake && \
# echo 'Y' | slackpkg install autoconf && \
# echo 'Y' | slackpkg install m4 && \
# echo 'Y' | slackpkg install zlib && \
# echo 'Y' | slackpkg install krb5 && \
# echo 'Y' | slackpkg install libproxy && \
# echo 'Y' | slackpkg install expat

#ENTRYPOINT [ "sh" ]

#  && \
# slackpkg install binutils && \
# slackpkg install kernel-headers && \
# slackpkg install pkg-tools && \
# slackpkg install glibc && \
# slackpkg install guile && \
# slackpkg install gc && \
# slackpkg install automake && \
# slackpkg install autoconf && \
# slackpkg install m4 && \
# slackpkg install zlib && \
# slackpkg install krb5
# #slackpkg install libproxy && \
# #slackpkg install expat





# RUN wget 'http://ftp.cc.uoc.gr/mirrors/nongnu.org/davfs2/davfs2-1.6.1.tar.gz'
# RUN tar zxf davfs2.tar.gz
# RUN cd davfs2
# RUN chmod +x davfs2.SlackBuild && ./davfs2.SlackBuild

# ENTRYPOINT [ "sh" ]