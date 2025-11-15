# This prints new line before prompt, except for the first one after starting shell.
precmd() {
  # print -z 'kcm '
  precmd() {
    echo
  }
}
