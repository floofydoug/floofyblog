class IPAddressesController < ApplicationController
  def new
  	@ip_address = IPAddress.new
  end
end
