workflow "Publish starter" {
  on = "push"
  resolves = ["johno/push-subdirectories@master"]
}

action "master" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "branch master"
}

action "johno/push-subdirectories@master" {
  uses = "johno/push-subdirectories@master"
  needs = ["master"]
  args = "examples johno"
  secrets = [
    "GITHUB_TOKEN",
    "API_TOKEN_GITHUB",
  ]
}
