load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "/usr/bin/entrypoint.sh returns 0" {
  run /bin/bash -c "dojo -c Dojofile.to_be_tested \"pwd && whoami\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "dojo init finished"
  assert_line --partial "/dojo/work"
  assert_line --partial "hugoide"
  refute_output --partial "IMAGE_VERSION"
  refute_output --partial "root"
  assert_equal "$status" 0
}
@test "correct hugo version is installed" {
  run /bin/bash -c "dojo -c Dojofile.to_be_tested \"hugo version\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "v0.55.1"
  assert_equal "$status" 0
}
@test "hugo init creates project" {
  run /bin/bash -c "dojo -c Dojofile.to_be_tested \"hugo new site quickstart\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "gohugo.io"
  assert_equal "$status" 0
}
