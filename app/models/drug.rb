class Drug < ActiveRecord::Base
      validates :drug_type, :effect, :description, :dependence_phisical, :dependence_physicological,
            :presence => true
      validates :name,
      		:presence => true,
            :uniqueness => true
end
