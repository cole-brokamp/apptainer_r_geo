set dotenv-load
R_version := "4.4.1"
app_version := "9001"
version_tag := R_version + "-" + app_version

# build apptainer
build:
  git tag {{version_tag}}
  apptainer build --force --build-arg R_VERSION={{R_version}} r_geo_v{{version_tag}}.sif r_geo.def

# shell into apptainer
shell:
  apptainer shell r_geo_v{{version_tag}}.sif

# push apptainer to ghcr.io
push_ghcr:
  apptainer registry login --username cole-brokamp --password $GITHUB_PAT docker://ghcr.io
  apptainer push r_geo_v{{version_tag}}.sif oras://ghcr.io/cole-brokamp/apptainer_r_geo:{{version_tag}}
