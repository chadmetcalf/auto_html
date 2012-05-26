AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, params: {}) do |text, options|
  regex = /(https?):\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
  text.gsub(regex) do
    protocol = $1
    youtube_id = $4
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		src = "#{protocol}://www.youtube.com/embed/#{youtube_id}"
		unless options[:params].empty?
		  src += "?"
		  params = []
  	  options[:params].each do |key, value|
		    params << "#{key}=#{value}"
	    end
	    src += params.join("&")
	  end
    %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end

