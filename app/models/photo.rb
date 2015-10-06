class Photo < ActiveRecord::Base
	belongs_to :album
	belongs_to :imageable, polymorphic: true
  
	has_attached_file :avatar, 
		path: ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
		url: "/system/:attachment/:id/:basename_:style.:extension",
		default_url: "/images/missing-image.png",
		styles: {
			thumb:   ['100x100#',  :jpg, quality: 70],
			preview: ['480x480#',  :jpg, quality: 70],
			large:   ['600>',      :jpg, quality: 70]
		},
		convert_options: {
			thumb: '-set colorspace sRGB -strip',
			preview: '-set colorspace sRGB -strip',
			large: '-set colorspace sRGB -strip'
		}

	validates_attachment_size :avatar, less_than: 300.kilobytes
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
