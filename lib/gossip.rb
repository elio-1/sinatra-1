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
    CSV.read("./db/gossip.csv", headers: true) #,
  end
end
