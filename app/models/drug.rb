class Drug < ActiveRecord::Base
      validates :drug_type, :origin, :average_ingest, :ingestion_form, :duration, :effect_high,
            :dependence_psychological, :dependence_phisical, :tolerance, :medical_use,
            :presence => true
      validates :name,
      		:presence => true,
            :uniqueness => true
end
