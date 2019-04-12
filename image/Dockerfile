FROM debian:9

############
# For ide:
# * entrypoint requires sudo and shadow
# * git is needed to install ide image configs
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends sudo git ca-certificates wget && \
  git clone --depth 1 -b 0.10.5 https://github.com/ai-traders/ide.git /tmp/ide_git && \
  /tmp/ide_git/ide_image_scripts/src/install.sh && \
  rm -r /tmp/ide_git && \
  echo 'ide ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
############

# install openssl or else there is error:
# wget: can't execute 'ssl_helper': No such file or directory
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.55.1/hugo_extended_0.55.1_Linux-64bit.tar.gz &&\
  tar -xzf hugo_extended_0.55.1_Linux-64bit.tar.gz &&\
  mv ./hugo* /usr/bin/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/bash"]

# For Bash
COPY profile /home/ide/.profile
COPY bashrc /home/ide/.bashrc
RUN chown ide:ide -R /home/ide

ARG this_image_tag_arg
ARG this_image_name_arg
ENV this_image_tag=${this_image_tag_arg} this_image_name=${this_image_name_arg}
