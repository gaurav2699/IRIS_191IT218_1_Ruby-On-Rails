class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    $users = User.all
    $transactions= Transaction.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def update_requested_by
     @book=Book.find(params[:id])
     k=0
     $transactions.each do |transaction|
       if transaction.requested_by_id==current_user.id and transaction.book_id==@book.id and (transaction.status==3 or (transaction.status==1 and transaction.returned=false))
         k=1
       end
     end
     @transaction=Transaction.new
    if k==0
      @transaction.update_attribute(:book_id, @book.id)
      @transaction.update_attribute(:requested_by, current_user.name )
      @transaction.update_attribute(:requested_by_id, current_user.id )
      @transaction.update_attribute(:requested, true)
      @transaction.update_attribute(:status, 3)
      @transaction.update_attribute(:issue_date, Date.today)
      redirect_to @book, notice: "Book issue request is successfully placed"
     else
      redirect_to books_url, notice: "You have already requested this book"
     end
  end


  def mybooks
   @books = Book.all
 end

 def requests
  @books = Book.all
end

def myrequests
 @books = Book.all
end

def approved
 @books = Book.all
end

def rejected
 @books = Book.all
end

def update_status_approved
  @transaction=Transaction.find(params[:id])
  @book=Book.find(@transaction.book_id)
  @transaction.update_attribute(:issued_to, @transaction.requested_by )
  @transaction.update_attribute(:issued_to_id, @transaction.requested_by_id )
  @transaction.update_attribute(:status, 1)
  @book.update_attribute(:quantity, @book.quantity-1)
  redirect_to @book, notice: "Book approved to the student"
end


def update_status_rejected
  @transaction=Transaction.find(params[:id])
  @book=Book.find(@transaction.book_id)
  @transaction.update_attribute(:status, 2)
  redirect_to @book, notice: "Book request is rejected"
end

def return
  @transaction=Transaction.find(params[:id])
  @book=Book.find(@transaction.book_id)
  @transaction.update_attribute(:returned, true)
  @transaction.update_attribute(:return_date, Date.today)
  @book.update_attribute(:quantity, @book.quantity+1)
  redirect_to @book, notice: "Book is returned"
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :quantity, :isbn, images: [])
    end
end
