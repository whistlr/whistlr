module Versions::LikeAVersionThatIsNested

  def success_handling
    assign_associations_to_master
    super
  end

  def delete_removed_associations(*associations)
    associations.each do |association|
      master.public_send(association).each do |this_association|
        master.public_send(association).delete(this_association) unless self.public_send(association).include? this_association
      end
    end
  end

  def add_new_associations(*associations)
    associations.each do |association|
      self.public_send(association).each do |this_association|
        master.public_send(association) << this_association unless master.public_send(association).include? this_association
      end
    end
  end

private

  def is_altered
  end

end