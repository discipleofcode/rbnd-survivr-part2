class Game
  
  attr_reader :tribes
  
  def initialize team_valor, team_mystic
    @tribes = [team_valor, team_mystic]
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
    merge_all_tribes.sample
  end
  
end