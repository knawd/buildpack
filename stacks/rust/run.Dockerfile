FROM scratch as run
LABEL io.buildpacks.stack.id="dev.knawd.stacks.rust"
USER 1000:1000
COPY layerfile .
