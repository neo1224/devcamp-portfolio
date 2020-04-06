class Portfolio < ApplicationRecord
	validates_presence of :title, :body, :main_image, :thumbnail_image
end
