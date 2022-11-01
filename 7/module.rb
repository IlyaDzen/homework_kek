module Company
  attr_accessor :company_name
end

module InstanceCounter
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    @@instances = []
    @@counter = 0

    def push_instances(instance)
      @@instances << instance
      @@counter += 1
    end

    def all_instances
      @@instances
    end

    def counter
      @@counter
    end
  end
end
