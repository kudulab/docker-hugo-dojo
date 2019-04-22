FROM debian:9

############
# For Dojo:
# * entrypoint requires sudo and shadow
# * git is needed to install ide image configs
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends sudo git ca-certificates wget && \
  git clone --depth 1 -b 0.2.1 https://github.com/ai-traders/dojo.git /tmp/dojo_git &&\
  /tmp/dojo_git/image_scripts/src/install.sh && \
  rm -r /tmp/dojo_git && \
  echo 'dojo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
############

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.55.1/hugo_extended_0.55.1_Linux-64bit.tar.gz &&\
  tar -xzf hugo_extended_0.55.1_Linux-64bit.tar.gz &&\
  mv ./hugo* /usr/bin/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/bash"]

# For Bash
COPY profile /home/dojo/.profile
COPY bashrc /home/dojo/.bashrc
RUN chown dojo:dojo -R /home/dojo

ARG this_image_tag_arg
ARG this_image_name_arg
ENV this_image_tag=${this_image_tag_arg} this_image_name=${this_image_name_arg}
