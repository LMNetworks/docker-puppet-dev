FROM lmnetworks/ruby:2.5.7_20191014

LABEL image_name="lmnetworks/puppet-dev"
LABEL maintainer="info@lm-net.it"

# Ruby cri-2.15.6 introduces a regression in r10k
# https://github.com/puppetlabs/r10k/issues/936#issuecomment-498189406
RUN apk add --no-cache git=2.22.0-r0 ruby-etc=2.5.7-r0 ruby-json=2.5.7-r0 && \
    gem install --no-ri --no-rdoc puppet:6.10.0 puppet-lint:2.4.1 cri:'<= 2.15.5' r10k:3.3.0 && \
    rm -rf /var/lib/gems/*/cache
