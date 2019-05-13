require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @answer_key = @analyzed_text.most_used_letter.map{|x, y| x}.join
    @answer_value = @analyzed_text.most_used_letter.map{|x, y| y}.join
    erb :results
  end
end
