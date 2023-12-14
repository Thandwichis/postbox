class HomeController < ApplicationController
  def index
  end

  def service_worker
    render js: file.read(Rails.root.join('app', 'javascript', 'service_worker.js')), content_type: 'application/javascript'
  end
  
end
