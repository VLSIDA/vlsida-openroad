# Target with dependencies and the binaries to run the complete flow
FROM openroad/ubuntu22.04-dev

WORKDIR /OpenROAD-flow-scripts

# synthesis tools binaries and plugins
COPY --from=openroad/yosys-dev /install ./tools/install/yosys

# openroad binary
COPY --from=openroad/ubuntu22.04-dev /OpenROAD/build/src/openroad ./tools/install/OpenROAD/bin/openroad

# flow files
#COPY ../env.sh .
COPY ../flow ./flow

# avoid issues with permissions
RUN chmod o+rw -R /OpenROAD-flow-scripts
