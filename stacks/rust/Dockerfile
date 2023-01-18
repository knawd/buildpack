FROM registry.access.redhat.com/ubi8/ubi as base

# 2. Set required CNB information
ENV CNB_USER_ID=1000
ENV CNB_GROUP_ID=1000
ENV CNB_STACK_ID="dev.knawd.stacks.rust"
LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"

# 3. Create the user
RUN groupadd cnb --gid ${CNB_GROUP_ID} && \
    useradd --uid ${CNB_USER_ID} --gid ${CNB_GROUP_ID} -m -s /bin/bash cnb

FROM scratch as run
# ENV CNB_USER_ID=1000
# ENV CNB_GROUP_ID=1000
# ENV CNB_STACK_ID="dev.knawd.stacks.rust"
# LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"

# # 3. Create the user
# RUN groupadd cnb --gid ${CNB_GROUP_ID} && \
#     useradd --uid ${CNB_USER_ID} --gid ${CNB_GROUP_ID} -m -s /bin/bash cnb
# ARG stack_id
LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"
USER ${CNB_USER_ID}:${CNB_GROUP_ID}

FROM base as build
LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"
USER ${CNB_USER_ID}:${CNB_GROUP_ID}

RUN yum install -y gcc openssl-devel && \
    rm -rf /var/cache/dnf && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH=~/.cargo/bin:${PATH}

RUN rustup target add wasm32-wasi


# 3. Create the user
# ARG stack_id
# ENV CNB_STACK_ID=${stack_id}
# LABEL io.buildpacks.stack.id=${stack_id}

# # Set user and group (as declared in base image)
# USER ${CNB_USER_ID}:${CNB_GROUP_ID}
# # 8. Install packages that we want to make available at build time

