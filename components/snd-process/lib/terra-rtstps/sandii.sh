snd_name="RT-STPS"
snd_cache_globs=(
*.h5
)

# RT-STPS config scripts expect ../data to exist
# We get around this by creating a data directory
#   and cd into it when processing starts
do_setup() {
  if [[ ! -d data ]]; then
    info "Creating data directory"
    mkdir data
  fi
  cd data

  if [[ ! -f leapsec.dat ]]; then
    if [[ -f $RTSTPS_HOME/leapsec.dat ]]; then
      cp $RTSTPS_HOME/leapsec.dat .
    else
      warn "Unable to copy leapsec.dat, processing may fail"
    fi
  fi
}

# Extract the file to the workspace, if compressed
#  and set the input to that file
do_fetch() {
  local _ftype=$(file --mime-type -b $input)
  if [[ $_ftype == "application/x-gzip" ]]; then
    info "Extracting $input"
    local _input_basename=$(basename $input .gz)
    gunzip -q $input -c > $_input_basename
    input=$_input_basename
  fi
}

do_process() {
  info "Starting processing of RT-STPS"

  info "Processing for TERRA"

  info "Running RT-STPS"
  ${RTSTPS_HOME}/bin/batch.sh terra.xml "$input"
}
