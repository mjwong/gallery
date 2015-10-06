module ApplicationHelper
	def photo_for(photo, align = {}, options = {})
    size = :large if options[:size].nil?
    align = "middle" if align.nil?
    unless photo.nil?
      title = options[:title].nil? ? (photo.caption.nil?  ? '' : photo.caption) : options[:title]
      link_to(image_tag(photo.avatar.url(:thumb), align: align), photo.avatar.url(size), title: title)
    else
      image_tag('missing-image.png')
    end
  end
end
