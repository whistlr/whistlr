class Follow < ActiveRecord::Base

  belongs_to :user
  belongs_to :followable, polymorphic: true

  validates_presence_of :user, :followable

  def self.create_following(params)
    follow = Follow.where(user: params[:user],
      followable_type: params[:followable_type],
      followable_id: params[:followable_id]).first_or_initialize
    if follow.new_record?
      follow.save
    else
      follow.destroy
    end
    return follow
  end

end
