class Upload < ActiveRecord::Base
  include Validations::UserCreated

  mount_uploader :file, UploadUploader

end