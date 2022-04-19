require "active_record"

module Models
  class User < ActiveRecord::Base
    validates :name, presence: true
    validates :uid, presence: true

    has_many :words

    include AASM

    aasm column: :new_word_chain do
      state :idle, initial: true
      state :new_word
      state :word_added
      state :new_translation
      state :translation_added

      event :new_word do
        transitions from: :idle, to: :new_word
      end

      event :add_word do
        transitions from: :new_word, to: :word_added
      end

      event :new_translation do
        transitions from: :word_added, to: :new_translation
      end

      event :add_translation do
        transitions from: :new_translation, to: :translation_added
      end

      event :finish do
        transitions to: :idle
      end
    end
  end
end
