require "active_record"

module Models
  class Word < ActiveRecord::Base
    validates :value, presence: true
    belongs_to :user
  end
end
