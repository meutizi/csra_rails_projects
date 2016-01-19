class Profile < ActiveRecord::Base
  belongs_to :user
    validate :custom_validator
    def custom_validator
        if !first_name.present? and !last_name.present?
            errors.add(:first_name, "must have a first_name")
        end
        if not (gender == "male" or gender == "female")
            errors.add(:gender, "must be male or female")
        end
        if gender == "male" and first_name == "Sue"
            errors.add(:gender, "males are never named Sue")
        end
    end
    
    scope :get_all_profiles, -> (min, max){where("birth_year BETWEEN ? AND ?", min, max).order(:birth_year)}
        

end
