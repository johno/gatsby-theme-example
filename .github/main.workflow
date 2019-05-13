workflow "Publish starter" {
  on = "push"
  resolves = ["master"]
}

action "master" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "branch master"
}
