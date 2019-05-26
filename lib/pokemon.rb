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
    db.execute("ALTER TABLE pokemon ADD hp integer NOT NULL DEFAULT(60)")
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    store = {:id => result[0][0], :name => result[0][1], :type => result[0][2], :db => db, :hp => 60}
    Pokemon.new(store)
  end 
end
