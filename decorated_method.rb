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
