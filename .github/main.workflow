workflow "Publish starter" {
  on = "push"
  resolves = ["Publish starter to own repo"]
}

action "Master branch" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "master"
}

action "Push starter to own repo" {
  uses = "johno/actions-push-subdirectories@master"
  needs = ["Master branch"]
  args = "examples"
  secrets = ["GITHUB_TOKEN", "GITHUB_API_TOKEN"]
}
