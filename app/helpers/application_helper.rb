module ApplicationHelper
	def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def local_icon(name, css_class)
  	image_tag("icons/#{name}.svg",  class: "#{css_class}") 
  end
end
