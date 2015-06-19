class Drug < ActiveRecord::Base
        has_attached_file :avatar, :styles => { :medium => "180x180>", :thumb => "100x100>" },
        validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
        validates :drug_type, :effect, :description, :dependence_phisical, :dependence_physicological,
            :presence => true
        validates :name,
        		:presence => true,
            :uniqueness => true
end
