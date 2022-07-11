require 'byebug'
require 'csv'
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_books, only: [:index, :bulk_upload, :bulk_destroy]

  # GET /books or /books.json
  def index
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def bulk_upload
    uploaded_file = params[:book][:file]
    File.open(Rails.root.join('public', 'uploads', 'books.csv'), 'wb') do |file|
      file.write(uploaded_file.read)
      BulkUploadBooks.perform_async(file.path)
    end

    redirect_to books_path
  end

  def bulk_destroy
    BulkDestroyBooks.perform_async

    redirect_to books_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def set_books
    @books = Book.paginate(page: params[:page], per_page: 5)
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :description)
  end

end
