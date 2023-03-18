ARG VERSION

FROM archlinux:${VERSION:-latest}
LABEL MAINTAINER="DCsunset"

# copy directory contents to /scripts
COPY ./scripts /scripts
ADD ./kitty /home/arch/.config/kitty
COPY ./.zshrc /home/arch/

WORKDIR /root

EXPOSE 5900 6080

CMD [ "/scripts/start.sh" ]
