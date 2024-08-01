set dotenv-load
R_version := "4.4.1"

# build apptainer
build:
  apptainer build --force --build-arg R_VERSION={{R_version}} r_geo_v{{R_version}}.sif r_geo.def

# shell into apptainer
shell:
  apptainer shell r_geo_v{{R_version}}.sif

# push apptainer to ghcr.io
push_ghcr:
  apptainer registry login --username cole-brokamp --password $GITHUB_PAT docker://ghcr.io
  apptainer push r_geo_v{{R_version}}.sif oras://ghcr.io/cole-brokamp/apptainer_r_geo:{{R_version}}
