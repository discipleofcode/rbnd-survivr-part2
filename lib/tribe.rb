class Tribe
  attr_reader :name, :members
  
  def initialize options = {}
    @name = options[:name]
    @members = options[:members]
    puts @members
  end
  
  def tribal_council options={}
    @members.reject{ |member| member == options[:immune]}.sample
  end
  
  def to_s
    @name
  end
  
end