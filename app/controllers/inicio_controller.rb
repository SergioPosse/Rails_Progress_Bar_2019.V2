class InicioController < ApplicationController
  def index
    
  end
  def export_users
    @job = Delayed::Job.enqueue ImportarJob.new
  end
end