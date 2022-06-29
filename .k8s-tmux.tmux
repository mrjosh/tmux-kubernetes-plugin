#!/usr/bin/env bash
#===============================================================================
#   Author: Alireza Josh
#    Email: josheghani.dev@gmail.com
#  Created: 2022-07-30 03:21
#===============================================================================

# $1: kubeconfig file
context_get() {
  local value="$(yq '.current-context' "$1")"
  [ -n "$value" ] && echo "$value" || echo "$2"
}
current_context=$(context_get '/Users/josh/.kube/config')

TC='#9370db'

KUBERNETES_CONTEXT="☸️ $current_context"
KUBERNETES_CONTEXT="#[fg=$TC] $KUBERNETES_CONTEXT  #[fg=$G05,bg=$BG]$right_arrow_icon"

tmux set-option -gq "status-justify" "left"
tmux set-option -gq "status-left" "$KUBERNETES_CONTEXT"
tmux set-option -gq status-left-length 20

