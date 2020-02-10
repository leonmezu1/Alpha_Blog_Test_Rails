# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was sucesfully created'
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def show; end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was succesfully deleted'
    redirect_to articles_path
  end

  def index
    @all_artis = Article.all
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was succesfully updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end