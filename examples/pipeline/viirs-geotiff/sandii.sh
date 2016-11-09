snd_name="VIIRS-GEOTIFF"
snd_cache_globs=(
  "*.tif"
)

do_process() {
  info("viirs2geotiff.sh -d $input")
  info("crefl2geotiff.sh -d $input")
}