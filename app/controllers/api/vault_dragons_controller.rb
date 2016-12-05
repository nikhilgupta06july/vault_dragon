class Api::VaultDragonsController < Api::BaseController
	skip_before_action :authenticate_api

  def show
    if params[:timestamp].present?
    	vault = VaultDragonVersion.where("`key` = ? and `updated_at` <= ? ", params[:id], Time.at(params[:timestamp].try(:to_i)).utc.to_s(:db) ).try(:last)
    else
    	vault = VaultDragonVersion.where(:key => params[:id] ).try(:last)
    end
    
	 if vault.present?
	 	render json: {:result => {:value =>  vault.value, :updated_at => vault.updated_at }} and return
	 else
	 	render json: {:error => "Key #{params[:id]} couldn't be found on server."}, status: 404  and return
	 end
    
  end
  
 
  def create
    
		begin	 		
	 		   
	 		response_hash = JSON.parse(request.body.try(:string))
	 	   if response_hash.is_a?(Hash) && response_hash.try(:keys).try(:size) == 1
	 	   	
	 	   	request_key = ""
	 			request_value  = ""
	 			response_hash.map do |key,val|
					request_key = key
					request_value = val 	 	
	 			end
	 		
	 			vault = VaultDragonVersion.find_or_create_by(:key => request_key, :value => request_value) 
	 			vault.updated_at = Time.now.utc.to_s(:db)
	 		
			
	 			render json: {:result => "Key #{request_key} has been saved with value #{request_value} at #{vault.updated_at} "} and return
	 		else
	 			raise JSON::ParserError
	 		end
	 		
	 		
	 	 rescue JSON::ParserError => e
	 		render json:  {:error => "Json format invalid.Make sure content type is application/json and request body is in {mykey:myvalue} format "}, status: 400 and return
	 	end
	 
  end

 

end
