class Tribe
  attr_reader :name, :members
  
  def initialize options = {}
    @name = options[:name]
    @members = options[:members]
    puts to_s
    print_members
  end
  
  def tribal_council options={}
    @members.reject{ |member| member == options[:immune]}.sample
  end
  
  def print_members
    puts "-" * @name.length
    puts @members.map{ |member| "#{member}"}.join(", ")
    puts
  end
  
  def to_s
    @name
  end
  
end