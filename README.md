# R geo apptainer

An apptainer image for running R, including some geospatial system dependencies gdal, geos, proj, and udunits2, as well as several database drivers.

Within the container, use the pak package to install R packages, as it is set to use the Posit Package Manager by default to install CRAN packages as binaries.
If pak is having problems installing packages (e.g., on the CCHMC HPC cluster), use the usual `install.packages()` and `remotes::install_github()` after setting the default CRAN repository to the Posit Package Manager by running this code (or sourcing it from an Rprofile):

```R
options(repos = c(CRAN = Sys.getenv("PKG_CRAN_MIRROR", unset = "https://cloud.r-project.org")))
```


## Using

Pull and run version of this container from its GitHub container registry by specifying a release tag.
The image tags correspond to version of R and the "dev" version of the `r_geo.def` file.
For example, the tag `4.4.1.9002` means that version `9002` of the repository was used to create a container running version 4.4.1 of R:

After installing or (`module load`-ing) Apptainer, pull the image as a Singularity Image File (.sif) to the working directory:

```sh
apptainer pull oras://ghcr.io/cole-brokamp/apptainer_r_geo:4.4.1.9002
```

Call the downloaded .sif to run the image, which here presents a bash shell where you can run `R`:

```sh
apptainer shell apptainer_r_geo_4.4.1.9002.sif
```

## Developing

Container versions are released through GitHub actions on new releases.
Use `just` to build, shell, tag, and manually push the R geo apptainer.
