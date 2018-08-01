class ApplicationController < ActionController::API

  def options                                                                                                                                                                                                                                                                              
		head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'                                                                                                                                                                                                       
  end
  
	#def getCopUsd
	##	require 'open-uri'
	#	require 'nokogiri'
  #    	doc 	= 	Nokogiri::HTML(open('http://www.dolar-colombia.com/'))
  #    	doc 	=	doc.css('.panel-body')[1]
  #    	doc 	=	doc.css('h1')[1].text
  #    	doc 	=	doc.to_s.split('$')[1]
  #    	doc 	=	doc.split(' ')[0]
  #    	doc 	=	doc.gsub!(',', '')
  #    	doc 	=	doc.to_f
	#	render json:  { dolar_today: doc }
	#end
	#def getBtcUsd
	#	last_price = 	Btce::Ticker.new "btc_usd"
	#	return render json: last_price
	#end

end
