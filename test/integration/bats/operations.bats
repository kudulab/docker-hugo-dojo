load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "/usr/bin/entrypoint.sh returns 0" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"pwd && whoami\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "ide init finished"
  assert_line --partial "/ide/work"
  assert_line --partial "hugoide"
  refute_output --partial "IMAGE_VERSION"
  refute_output --partial "root"
  assert_equal "$status" 0
}
@test "correct hugo version is installed" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"hugo version\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "v0.33"
  assert_equal "$status" 0
}
