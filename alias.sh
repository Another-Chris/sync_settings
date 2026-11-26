source ~/.bashrc

_k_run() {
  local mode="$1"
  shift
  local dir="$HOME/.pi/agent/prompts/kaggle"
  pi --model open-router/meta/muse-spark-1.3-contributor --thinking high --agents-files "${dir}/shared.md,${dir}/${mode}.md" "$@"
}

k-scaffold() {
  _k_run scaffold "$@"
}

k-research() {
  _k_run research "$@"
}

k-exp() {
  _k_run experiment \
    --exclude-tools memory_type_upsert,memory_deprecate,memory_consolidate \
    "$@"
}
