snd_name="SPoRT LBC"

do_setup() {
  mkdir sandbox
  mkdir binaries
  mkdir archive
}

do_process() {
  pushd binaries

  /opt/polar2grid/bin/viirs2binary.sh -p m12 m14 m15 m16 m_sat_zenith_angle m_solar_zenith_angle --grid-coverage=0.01 -g 203 -f $input

  popd

  source /opt/rh/python27/enable
  source /opt/sport/bin/activate

  export LBC_SANDBOX_DIR=$(pwd)/sandbox
  export LBC_ARCHIVE_DIR=$(pwd)/archive

  python /opt/sport/sport/code/viirs_AK_awips_processing_atGINA.py $(pwd)/binaries
}