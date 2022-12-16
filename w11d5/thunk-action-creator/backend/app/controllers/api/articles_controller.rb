require "active_support"
require "active_support/core_ext/hash/keys"

class Api::ArticlesController < ApplicationController
  wrap_parameters include: Article.attribute_names + ['imageUrl']

  def index
    articles = Article.all.map do |article|
      article.as_json.deep_transform_keys! { |key| key.camelize(:lower) }
    end
    render json: articles 
  end

  def create
    article = Article.create(article_params)

    if (article)
      render json: article.as_json.deep_transform_keys! { |key| key.camelize(:lower) }
    else
      render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :image_url, :body)
  end
end
