class ClientsController < ApplicationController

  def download_pdf         
    generate_pdf      
    send_file 'tmp/download.pdf',
              filename: "download.pdf",
              type: "application/pdf"
  end
  
  def original_url
    base_url + original_fullpath
  end

  private

  def generate_pdf()   
    refer = request.original_url
    url = refer.split("?")
    url_scrape = url[1] + '#' + url[2] 
# puts url_scrape
    system("phantomjs rasterize.js '#{url_scrape}' tmp/download.pdf '1600px*1000px'")              
    # pdf = `phantomjs rasterize.js '#{url_scrape}' download.pdf '1100px*1000px'`
    # return pdf
  end
end