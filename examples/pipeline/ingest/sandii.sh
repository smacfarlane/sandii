snd_name="SNPP-INGEST"
snd_cache_globs=(
  "*.gz"
)

do_fetch() {
  info "Fetching pass data from ${input}"
  wget $input
}

do_process() {
  # No Op
  return 0
}