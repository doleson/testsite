class ApplicationController < ActionController::Base
  def generate_pdf
    system("phantomjs myscript.js #{header["REFERER"]} download.pdf '1100px*1000px'")
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
