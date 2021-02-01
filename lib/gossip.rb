
class Gossip
attr_reader :author, :content
  def initialize(author, content)
    @author, @content = author, content
  end
  
  def save
    CSV.open("./db/gossip.csv", 'a+') do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
      all_gossips = []
      
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  
  def self.find(id)
    selected_gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index| 
      if (id == index+1)
        selected_gossips << Gossip.new(csv_line[0], csv_line[1]) 
      end
    end 
    return selected_gossips
  end
  
  def self.update(id)
    self.find(id)
    selected_gossips.save
  end
end
