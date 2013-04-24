class IpAddressesController < ApplicationController
  def new
  	@ip_address = IPAddress.new
  end
end
