# test/models/arm_test.rb
require 'test_helper'

class ArmTest < ActiveSupport::TestCase
  test 'should save and find arm' do
    arm = Arm.new(input_params: { key1: 'value1', key2: 'value2' }, result: { key3: 'value3' })
    assert arm.save

    found_arm = Arm.find_by(input_params: { key1: 'value1', key2: 'value2' })
    assert_equal arm.result, found_arm.result
  end

  test 'should not save arm with duplicate input_params' do
    arm1 = Arm.new(input_params: { key1: 'value1', key2: 'value2' }, result: { key3: 'value3' })
    arm1.save

    arm2 = Arm.new(input_params: { key1: 'value1', key2: 'value2' }, result: { key3: 'value3' })
    assert_not arm2.save, 'Expected arm2 not to be saved with duplicate input_params'

    # Add this assertion to verify that the error message matches our expectation
    assert_includes arm2.errors.full_messages, 'Input params has already been taken'
  end
end
