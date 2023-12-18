# frozen_string_literal: true

# Some class
class ArmsController < ApplicationController
  def input; end

  def armstrong?(number)
    digits = number.to_s.split('').map(&:to_i)
    num_n = digits.length
    digits.sum { |d| d**num_n } == number
  end

  def output
    num_n = params[:val].to_i
    @armstrong_numbers = find_or_create_arm_record(num_n)

    puts "Armstrong Numbers: #{@armstrong_numbers}"

    respond_to do |format|
      format.html
      format.json { render json: @armstrong_numbers }
    end
  end

  private

  def find_or_create_arm_record(num_n)
    existing_arm_record = Arm.find_by(val: params[:val])

    if existing_arm_record
      JSON.parse(existing_arm_record.result)
    else
      calculate_and_save_armstrong_numbers(num_n)
    end
  end

  def calculate_and_save_armstrong_numbers(num_n)
    armstrong_numbers = (10**(num_n - 1)..(10**num_n - 1)).select { |num| armstrong?(num) }
    Arm.create(val: params[:val], result: armstrong_numbers.to_json)
    armstrong_numbers
  end
end
