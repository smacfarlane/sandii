snd_name="CSPP-VIIRS-SDR"
snd_cache_globs=("*.h5")

do_process() {
  if [[ -f $CSPP_SDR_HOME/cspp_sdr_env.sh ]]; then
    source $CSPP_SDR_HOME/cspp_sdr_env.sh
  fi

  info "$CSPP_SDR_HOME/viirs_sdr.sh -p $(nproc) -z -e $input"
}