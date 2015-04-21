class Step < ActiveRecord::Base
    belongs_to :list

    scope :complete, ->{ where(:complete => true)}
    scope :incomplete, ->{ where(:complete => false)}
end
