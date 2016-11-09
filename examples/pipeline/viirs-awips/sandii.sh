snd_name="VIIRS-AWIPS"
snd_cache_globs=(
  "UAF_AWIPS_npp_viirs_adaptive*"
  "UAF_AWIPS_npp_viirs_dynamic_dnb*"
  "UAF_AWIPS_npp_viirs_i0[1-5]*"
  "UAF_AWIPS_npp_viirs_m0[3459]*"
  "UAF_AWIPS_npp_viirs_m1[13456]*"
  "UAF_AWIPS_npp_viirs_viirs_crefl0[3489]*"
  "UAF_AWIPS_npp_viirs_viirs_crefl10*"
  "UAF_AWIPS_npp_viirs_viirs_ifog*"
)

do_process() {
  local _options=(
    "--grid-coverage 0"
    "--day-fraction 0.10"
    "-g 203"
    "--backend-configs uaf_awips_backend.ini"
  )

  info("viirs_awips.sh -d $input ${_options}")

  local _options=(
    "--grid-coverage 0"
    "-g 203"
    "--backend-configs uaf_awips_backend.ini"
    "-p viirs_crefl03 viirs_crefl04  viirs_crefl08 viirs_crefl09 viirs_crefl10"
  )
  info("crefl2awips.sh -d $input ${_options}")
}

do_cache() {
  for glob in "${globs[@]}"; do
    gzip $glob
  done
  _do_default_cache
}