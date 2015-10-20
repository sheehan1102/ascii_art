require 'sinatra'
require 'sinatra/reloader'
require 'artii'

get "/ascii/:word/?:font?/?:secret?" do
	if params[:word] == 'dog' && params[:font] == 'special' && params[:secret] == "secret"
		redirect to("/doge")
	elsif params[:font]
		art = Artii::Base.new(:font => params[:font])
		@word = art.asciify(params[:word])
	else
		art = Artii::Base.new
		@word = art.asciify(params[:word])
	end
	erb :word_view
end

get "/doge" do
	erb :doge
end