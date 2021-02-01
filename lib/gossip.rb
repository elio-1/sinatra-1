
class Gossip
attr_reader :author, :content
  def initialize(author, content)
    @author, @content = author, content
  end
  
  def save                                      #Save a post
    CSV.open("./db/gossip.csv", 'ab') do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all                                  # add all line of the csv file into and array
      all_gossips = []
      
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  
  def self.find(id)                             # add a single line into an array using index
    selected_gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index| 
      if (id == index+1)
        selected_gossips << Gossip.new(csv_line[0], csv_line[1]) 
      end
    end 
    return selected_gossips
  end
  
  
  def self.update(id)
    gossips_to_update = self.find(id)
    gossips_to_update.delete
    self.save
  end
end
