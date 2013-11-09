class PollAttributes < ActiveRecord::Base
  include Validations::UserCreated

  belongs_to :pollable, polymorphic: true

end