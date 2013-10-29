 #!/usr/bin/ruby

class Post
  attr_accessor :title, :content, :state

  def initialize(title, content, state = :draft)
    @title, @content, @state = title, content, state
  end

  states = [:draft, :posted, :deleted]
  states.each do |state|
    define_method state do
      @state = state
    end
    puts self
  end
end
