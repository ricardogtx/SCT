class Clinic < ActiveRecord::Base
  belongs_to :user
  belongs_to :state

  def estado= nome_estado
    self.state = State.find_by_name nome_estado
  end

  def estado
    if self.state.nil?
      nil
    else
      self.state.name
    end
  end
end
