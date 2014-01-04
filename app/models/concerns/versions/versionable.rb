module Versions::Versionable
  extend ActiveSupport::Concern

  included do
    attr_accessor :user, :notes

    has_many :versions, class_name: self.name.gsub("Master", "Version"), dependent: :destroy, foreign_key: :master_id

    after_create :clone_initial_version

    scope :approved, -> { where(approved: true) }
    scope :pending, -> { where(pending: true) }
    scope :declined, -> { where(declined: true) }
    scope :not_declined, -> { where(declined: false) }
  end

  def initial_version
    versions.initial
  end

  def approved_versions
    versions.approved
  end

  def last_approved_version
    approved_versions.last || initial_version unless versions.length == 0
  end

  def create_version(params, initial = false)
    versions.create(params.merge(initial: initial))
  end

  def initialize_version(params, initial = false)
    versions.new(params.merge(initial: initial))
  end

  def nested_model_has_changed(previous_nested_version, param_values)
    previous_nested_version.attributes.except("id", "previous_id").each do |attr, value|
      return true if value.to_s != param_values[attr].to_s
    end
    return false
  end

  def update_with_nested_models(main_params, nested_model_params)
    version = initialize_version(main_params)
    nested_model_params.each do |param_key, param_values|
      nested_model_name = param_key.to_s.gsub("_attributes", "").to_sym
      nested_model_array = self.public_send(nested_model_name)
      nested_model_class = self.class.reflect_on_association(nested_model_name.to_sym).options[:class_name].constantize
      param_values.each do |key|
        if key[:_destroy] == false
          if key[:id].present? && previous_nested_version = nested_model_array.find(key[:id])
            if nested_model_has_changed(previous_nested_version, key)
              new_nested_version = nested_model_class.new(key.except("id"))
              new_nested_version.previous = previous_nested_version
              version.public_send(nested_model_name) << new_nested_version
            else
              version.public_send(nested_model_name) << previous_nested_version
            end
          else
            new_nested_version = nested_model_class.new(key.except("id"))
            version.public_send(nested_model_name) << new_nested_version
          end
        end
      end
    end
    version.save
    version
  end

private

  def clone_initial_version
    params = self.attributes.except("id", "type", "approved", "pending", "declined", "master_id", "slug").merge(user: user, notes: notes)
    self.create_version(params, true)
  end
end