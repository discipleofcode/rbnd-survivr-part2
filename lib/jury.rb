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
      start_string = "#{finalist} got #{score} "
      score != 1 ? (puts start_string + "votes") : (puts start_string + "vote")
    end
  end
  
  def cast_votes finalists
    votes = initialize_votes finalists
    votes = randomize_votes votes, finalists
    
    return votes
  end
  
  def announce_winner votes
    votes.max_by{|finalist, score| score}[0]
  end

end