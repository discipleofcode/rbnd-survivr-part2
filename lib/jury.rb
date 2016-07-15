class Jury

  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member member
    @members << member
  end
  
  def initialize_votes finalists
    votes = {}
    finalists.each do |finalist|
      votes[finalist] = 0
    end
    
    return votes
  end
  
  def randomize_votes votes, finalists
    @members.each do |member|
      chosen_finalist = finalists.sample
      puts "#{member.name} votes for #{chosen_finalist}"
      votes[chosen_finalist] += 1
    end
    
    return votes
  end
  
  def report_votes votes    
    votes.each do |finalist, score|
      start_string = "#{finalist} got #{score} ".yellow
      score != 1 ? (puts start_string + "votes".yellow) : (puts start_string + "vote".yellow)
    end
  end
  
  def cast_votes finalists
    votes = initialize_votes finalists
    votes = randomize_votes votes, finalists
    
    return votes
  end
  
  def announce_winner votes
    winner = votes.max_by{|finalist, votes| votes}.first
    puts ">> Winner: #{winner}. Congratulations <<".yellow
    return winner
  end

end