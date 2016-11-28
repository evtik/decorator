module Decorators
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def add_prefix(*args)
      prev_method_added = method :method_added

      define_singleton_method :method_added do |method_name|
        define_singleton_method :method_added, prev_method_added
        method_to_decorate = instance_method method_name
        define_method method_name do
          args * '' + method_to_decorate.bind(self).call
        end
      end
    end
  end
end

class C
  include Decorators

  add_prefix('salut ')
  add_prefix('hello ', 'hi ')
  def a
    'from a'
  end

  def b
    'from b'
  end
end

puts C.new.a # 'salut hello hi from a'
puts C.new.b # 'from b'
