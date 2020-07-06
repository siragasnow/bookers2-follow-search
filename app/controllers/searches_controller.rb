class SearchesController < ApplicationController
	def search
		@range = params[:range]
		search = params[:search]
		word = params[:word]

		if
			@range == '1'
			@word = params[:word]
			@user = User.search(search, word)
		else
			@word = params[:word]
			@book = Book.search(search, word)
		end
	end
end
