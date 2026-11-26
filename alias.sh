source ~/.bashrc

_k_run() {
  local mode_file="$1"
  shift
  local prompt
  pi --thinking high "$@"
}

k-scaffold() {
  _k_run --agents-files ~/.pi/agent/prompts/kaggle/shared.md,~/.pi/agent/prompts/kaggle/scaffold.md "$@"
}

k-research() {
  _k_run --agents-files ~/.pi/agent/prompts/kaggle/shared.md,~/.pi/agent/prompts/kaggle/research.md "$@"
}

k-exp() {
  _k_run --agents-files ~/.pi/agent/prompts/kaggle/shared.md,~/.pi/agent/prompts/kaggle/experiment.md \
    --exclude-tools memory_type_upsert,memory_deprecate,memory_consolidate \
    "$@"
}

