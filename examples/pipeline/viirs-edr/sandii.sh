snd_name="CSPP-VIIRS-EDR"
snd_cache_globs=("*.h5")

do_process() {
  if [[ -f $CSPP_EDR_HOME/cspp_edr_env.sh ]]; then
    source $CSPP_EDR_HOME/cspp_edr_env.sh
  fi

  info "$CSPP_EDR_HOME/viirs_edr.sh -z --alg='all' $input"
}