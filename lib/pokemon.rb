require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(x)
    
    @id = x[:id] 
    @name = x[:name] 
    @type = x[:type] 
    @db = x[:db]
    
    if x[:hp] then @hp = x[:hp] else nil end 
      
  end
  
  def self.save(name, type, db)
  
    db.execute("INSERT INTO pokemon (name, type)
      VALUES (?, ?)", name, type)
  
  end  
  
  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    store = {:id => result[0][0], :name => result[0][1], :type => result[0][2], :hp => result[0][3], :db => db}
    Pokemon.new(store)
  end 
  
  def alter_hp(hp,db)
    self.hp = hp
    
    "UPDATE songs SET album = ? WHERE name = ?"
  end 
  
end
