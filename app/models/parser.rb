class Parser < ActiveRecord::Base

  def self.import(file)
    create_states
    CSV.foreach(file.path, headers: true, encoding: "UTF-8") do |row|
      Clinic.create! row.to_hash
    end
  end

  def self.create_states
    dataStates = YAML::load_file(File.join(Rails.root,"public/static/states.yml"))

    dataStates.each do |state|
      State.create! :name => state["estado"]["nome"], :uf => state["estado"]["uf"]
    end
  end

end
