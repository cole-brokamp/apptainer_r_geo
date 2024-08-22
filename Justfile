set dotenv-load
R_version := "4.4.1"
Python_version := "3.12.4"
app_version := "9002"
version_tag := R_version + "." + app_version

# build apptainer
build:
  apptainer build --force --build-arg R_VERSION={{R_version}} --build-arg PYTHON_VERSION={{Python_version}} r_geo_v{{version_tag}}.sif r_geo.def

# shell into apptainer
shell:
  apptainer shell r_geo_v{{version_tag}}.sif

# tag and push to github
tag:
  git tag {{version_tag}}
  git push origin tag {{version_tag}}

# push apptainer to ghcr.io
push_ghcr:
  apptainer registry login --username cole-brokamp --password $GITHUB_PAT docker://ghcr.io
  apptainer push r_geo_v{{version_tag}}.sif oras://ghcr.io/cole-brokamp/apptainer_r_geo:{{version_tag}}
