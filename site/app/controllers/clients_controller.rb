class ClientsController < ApplicationController

  def download_pdf         
    generate_pdf      
    send_file 'download.pdf',
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

    system("phantomjs rasterize.js '#{url_scrape}' download.pdf '1100px*1000px'")              
    # pdf = `phantomjs rasterize.js '#{url_scrape}' download.pdf '1100px*1000px'`
    # return pdf
  end
end

# output = "phantomjs rasterize.js 'http://0.0.0.0:8000/texas_map12.html#rooms=&usChart=Lake+Houston%2F+Kingwood&dateChart=Sun+Dec+31+2000+16%3A00%3A00+GMT-0800+(PST)%2CMon+Nov+30+2015+16%3A00%3A00+GMT-0800+(PST)&latlon=29.85136421498196_-95.39978027343751_9&compareChart=false&yearBuilt=%2C2015&pricePerUnit=0%2C420000&buildingClass=&infillSuburban=&deletedDIds=&developer=&userClickedMarkers=falseurldividorprice_per_uniturldividorundefinedurldividorundefined' download.pdf '1100px*1000px'"