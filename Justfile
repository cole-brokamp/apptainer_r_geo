R_version := "4.4.1"

# build apptainer
build:
  apptainer build --force --build-arg R_VERSION={{R_version}} r_geo_v{{R_version}}.sif r_geo.def

# shell into apptainer
shell:
  apptainer shell r_geo_v{{R_version}}.sif
  
