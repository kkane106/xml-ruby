require 'rexml/document'
include REXML

class XMLBookParser
  attr_accessor :books

  def initialize file
    @books = []
    parseXML(file)
  end

  def parseXML file
    xmlfile = File.new(file)
    xmldoc = Document.new(xmlfile)
    root = xmldoc.root
  
    book_arr = []

    root.elements.each('book') do |b|
      book = Book.new
      book.isbn = b.elements['isbn'].get_text.value
      book.title = b.elements['title'].get_text.value
      book.author = b.elements['author'].get_text.value
      book.publication_year = b.elements['publication-year'].get_text.value
      book_arr.push(book)
    end
    @books = book_arr
  end
  
  def show_books
    @books.each do |b|
      b.showBook
    end
  end
end

class Book
  attr_accessor :isbn, :title, :author, :publication_year
  
  def showBook
    puts "ISBN: " + @isbn
    puts "Title: " + @title
    puts "Author: " + @author
    puts "Publication Year: " + @publication_year
    puts "----------------"
  end
end