class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name

  # define membership many-to-many relation
  has_many :memberships, :dependent => :destroy
  has_many :members, :through => :memberships

  # def self.find
  # 	find(params[:id])
  # end

	def joined?(member)
		return false if member.nil?
	  memberships.find_by_member_id(member.id)
	end

end
