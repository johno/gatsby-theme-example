workflow "Publish starter" {
  on = "push"
  resolves = ["johno/actions-push-subdirectories@master"]
}

action "Master branch" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "master"
}

action "johno/actions-push-subdirectories@master" {
  uses = "johno/actions-push-subdirectories"
  needs = ["Master branch"]
  args = "examples"
  secrets = ["GITHUB_TOKEN", "GITHUB_API_TOKEN"]
}
