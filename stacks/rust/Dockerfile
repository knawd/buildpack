FROM registry.access.redhat.com/ubi8/ubi as base

# 2. Set required CNB information
ENV CNB_USER_ID=1000
ENV CNB_GROUP_ID=1000
ENV CNB_STACK_ID="dev.knawd.stacks.rust"
LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"

RUN yum install -y gcc openssl-devel && \
    rm -rf /var/cache/dnf

# 3. Create the user
RUN groupadd cnb --gid ${CNB_GROUP_ID} && \
    useradd --uid ${CNB_USER_ID} --gid ${CNB_GROUP_ID} -m -s /bin/bash cnb

FROM quay.io/knawd/scratch as run

FROM base as build
LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"
USER ${CNB_USER_ID}:${CNB_GROUP_ID}

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH=/home/cnb/.cargo/bin:${PATH}

RUN rustup target add wasm32-wasi
