FROM debian
# Add Tailscale's GPG key
RUN apt-get update && apt-get install -fy curl gnupg2 && \
  curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.gpg | apt-key add - && \
  curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.list | tee /etc/apt/sources.list.d/tailscale.list && \
  apt-get update && apt-get install -fy tailscale && \
  rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*
