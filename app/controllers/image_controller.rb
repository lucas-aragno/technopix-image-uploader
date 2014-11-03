class ImageController < ApplicationController
  def store_image
    decoded_file = Base64.decode64(params[:encoded_image])
    begin
      file = Tempfile.new(['test', '.jpg'])
      file.binmode
      file.write decoded_file
      file.close
      @image = Image.new
      @image.photo =  File.new(file.open)
      if @image.save
        render :json => {:image_id => @image.id, :message => "Successfully uploaded the picture."}
      else
        render :json => {:message => "Failed to upload image"}
     end
    ensure
       file.close
       file.unlink
    end
  end


  def return_image
    @image = Image.find(params[:image_id])
    send_data Paperclip.io_adapters.for(@image.photo).read, :type => @image.photo.content_type,:disposition => 'inline'

  end

end
