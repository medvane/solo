class ArticleType < ActiveRecord::Base
  belongs_to :article
  belongs_to :pubtype
end
