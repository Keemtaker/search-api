
class PagesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'json'
  require 'date'


  def count
    letter = params[:query]
    url = "https://start-up.house/"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    nodes = html_doc.search('body')
    @nodes_hash = {}

    nodes.each do |node|

      @nodes_hash[:reponse] = {}
      @nodes_hash[:reponse][:current_date] = Date.today
      @nodes_hash[:reponse][:letters_count] = node.text.strip.count(letter)
      @nodes_hash[:reponse][:letter] = letter
    end


    @new_node = @nodes_hash.to_json

    respond_to do |format|
      format.json { render json: @new_node }
    end

  end
end

