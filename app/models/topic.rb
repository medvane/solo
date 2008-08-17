class Topic < ActiveRecord::Base
  belongs_to :article
  belongs_to :subject
end
