class HomeController < ApplicationController
  def index
    @data = {
      definitions: [],
      post_url: home_index_path
    }.to_json
  end

  def create
    word = Word.new(word_params)
    return render json: word.errors.messages, status: 400 unless word.valid?

    render json: word.get_definitions
  end

  private
    def word_params
      params.require(:word).permit(:value)
    end
end
