require_relative 'accessors'
require_relative 'validation'


class Test
  extend Accessors
  extend Validation

  attr_reader :name
  attr_accessor_with_history :my_attr, :a, :b, :c
  strong_attr_accessor :number, Integer
  validate :name, :presence
  validate :name, :format, /[A-Z]/
  # validate :name, :type, String

  def initialize(name = nil)
    @name = name
  end
end