Paperclip::Interpolations.class_eval do

    def extension attachment, style_name
        ((style = attachment.styles[style_name]) && style[:format]) ||
          File.extname(attachment.original_filename || '').gsub(/^\.+/, "")
    end

    def basename attachment, style_name
      if attachment.original_filename.present?
        attachment.original_filename.gsub(/#{Regexp.escape(File.extname(attachment.original_filename))}\Z/, "")
      end
    end

end
