class BooksController < ApplicationController
  before_action :authenticate_user!

  def show
    @book_new = Book.new
  	@book = Book.find(params[:id])
    @book_comment =BookComment.new
    @user = @book.user
  end

  def index
  	@books = Book.all
    @book =  Book.new
     #一覧表示するためにBookモデルの情報を全てくださいのall
  end

  def create
  	@book = Book.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
  	@book.user_id = current_user.id

    if @book.save #入力されたデータをdbに保存する。
  		redirect_to @book, notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
      @user = current_user
  		@books = Book.all
  		render ("books/index")
  	end
  end

  def edit
  end



  def update
  	if @book.update(book_params)
  		redirect_to @book, notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def destroy
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

end
