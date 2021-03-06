# Dynamic Dispatch

class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
obj.my_method(3) # => 6

obj.send(:my_method, 3) # => 6

# method_missing

obj.unknown_method # error!

BasicObject.private_instance_methods # includes method_missing
obj.method_missing(:my_method) # cannot do because it's private
obj.send :method_missing, :my_method # the same error as before!

# [explain with diagram]

# Ghost Methods

class C
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

obj = C.new
obj.unknown_method('a', 'b') do
  # a block
end

# Quiz: 2.ghost_methods

# Dynamic Methods

class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
obj.my_method(2) # => 6

# Quiz: 2.dynamic_methods

# Quiz: 2.bug_hunt

# [discuss: Ghost Methods vs. Dynamic Methods]