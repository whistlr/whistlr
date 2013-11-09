module Stat::Base
  extend ActiveSupport::Concern

  included do
    belongs_to :user

    after_save :update_reputation
  end

  module ClassMethods
    def stat_attributes
      rejects = ["user_id", "id"]
      column_names.reject{|attr| rejects.include?(attr)}.collect{|attr| attr.to_sym}
    end

    def reputation_name
      (name.split("::")[1].gsub("Stat", "").underscore+"_reputation").to_sym
    end

    def multipliers(*multipliers)
      stat_attributes.each do |stat|
        define_singleton_method (stat.to_s+"_multiplier").to_sym do
          if multipliers[0].include?(stat)
            multipliers[0][stat]
          else
            0
          end
        end
      end
    end
  end

private

  def update_reputation
    reputation = 0
    self.class.stat_attributes.each do |attr|
      reputation += self.public_send(attr) * self.class.public_send((attr.to_s + "_multiplier").to_sym)
    end
    user.update_column(self.class.reputation_name, reputation)
  end
end
