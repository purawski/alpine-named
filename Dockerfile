FROM alpine:3.7
MAINTAINER Pawel Urawski <Pawel.Urawski@gmail.com>

# Install samba
#RUN apk --no-cache --no-progress upgrade && \
#    apk --no-cache --no-progress add bash samba shadow && \
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add bash-completion bind
    
#RUN adduser -D -G users -H -g 'Samba User' -h /tmp smbuser 

#COPY samba.sh /usr/bin/

EXPOSE 53/udp 953/udp 53 953

#HEALTHCHECK --interval=60s --timeout=15s \
#             CMD smbclient -L '\\localhost\' -U 'guest%' -m SMB3
#VOLUME ["/etc/samba"]
COPY init.sh /
CMD ["/init.sh"]
#ENTRYPOINT ["init.sh"]
