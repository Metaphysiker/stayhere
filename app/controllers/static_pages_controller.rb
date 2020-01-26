class StaticPagesController < ApplicationController
  def welcome
  end

  def open_letter
  end

  def biel
  end

  def press_review
  end

  def asyl
  end

  def donate
  end

  def archive
  end

  def contact
  end

  def about
  end

  def langbruck
  end

  def children_right
  end

  def preles
  end

  def download_pdf

    name = params[:name]

    send_file(
      "#{Rails.root}/public/pdfs/#{name}.pdf",
      filename: "#{name}.pdf",
      type: "application/pdf"
    )
  end

  def download_jpg

    name = params[:name]

    send_file(
      "#{Rails.root}/public/pdfs/#{name}.jpg",
      filename: "#{name}.jpg",
      type: "image/jpeg"
    )
  end

end
