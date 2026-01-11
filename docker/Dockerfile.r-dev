FROM docker.io/rkrispin/baser-4.4.0:0.0.1

COPY setting_files/install_packages.R setting_files/packages.json pkgs/

RUN Rscript pkgs/install_packages.R