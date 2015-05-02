class Drug < ActiveRecord::Base
  validates :name, :drug_type, :origin, :average_ingest, :ingestion_form, :effect_average, :effect_high,
            :duration, :dependence_psychological, :dependence_phisical, :tolerance, :high_term,
            :long_effects, :medical_use,
            :presence => true
end
