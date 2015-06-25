class Drug < ActiveRecord::Base
      validates :drug_type,:dependence_psychological, :dependence_phisical, :description,
            :presence => true

      validates :name,
      		:presence => true,
             :uniqueness => true

      has_attached_file :avatar, :styles => { :medium => "180x180>", :thumb => "100x100>" }
      validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
