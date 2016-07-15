class Game
  
  attr_reader :tribes
  
  def initialize *tribes
    @tribes = tribes
  end
  
  def add_tribe tribe
    @tribes << tribe
  end
  
  def immunity_challenge
    @tribes.sample
  end
  
  def clear_tribes
    @tribes = []
  end
  
  def merge_all_tribes
    merged_tribes = []
    @tribes.each do |tribe|
      merged_tribes << tribe.members
    end
    
    merged_tribes.flatten
  end
  
  def merge name
    tribe = Tribe.new({ name: name, members: merge_all_tribes })
    clear_tribes
    @tribes << tribe

    @tribes.first
  end
  
  def individual_immunity_challenge
    @tribes.first.members.sample
  end
  
end