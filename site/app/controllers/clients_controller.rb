require 'prawn'
class ClientsController < ApplicationController

  def download_pdf
    client = "tyolo"
    send_data generate_pdf(client),
              filename: "#{client}.pdf",
              type: "application/pdf"
  end

  private

  def generate_pdf(client)
    system("phantomjs myscript.js #{headers["REFERER"]} #{client}.pdf '1100px*1000px'")  end
end