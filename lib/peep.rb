require "pg"

class Peep
  def self.all
      if ENV['ENVIRONMENT'] == "test"
        connection = PG.connect(dbname: "chitter_test")
      else
        connection = PG.connect(dbname: "chitter")
      end
    
      results = connection.exec("SELECT * FROM peeps;")
      results.map { |peep| peep["message"] }

  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end 

end 
