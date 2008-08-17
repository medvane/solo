class Authorship < ActiveRecord::Base
  belongs_to :article
  belongs_to :author
end
