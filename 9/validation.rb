module Validation
  def validate(name, type, option = nil)
    # raise if send("#{name}").nil?
    valid?(name)
    validate!(name, option)

  end

 

  def valid?(name)
    define_method('valid?') do
      !send(name).nil?
    end
  end

  def validate!(name, option)
    define_method('validate!') do 
      raise 'Presence failed' unless !send(name).nil?
      raise 'Format is not A-Z' unless send(name).match?(option)
    end
  end

end

