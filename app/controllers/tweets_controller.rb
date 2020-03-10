class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
    
  def show  
  end
    
  def new
    @tweet = Tweet.new
  end
    
  def create
    @tweet = Tweet.new(tweet_params)
    
    if @tweet.save
      flash[:success] = 'Tweet が正常に投稿されました'
      redirect_to @tweet
    else
      flash[:danger] = 'Tweet が投稿されませんでした'
      render :new
    end
  end
    
  def edit
  end
    
  def update
    if @tweet.update(tweet_params)
      flash[:success] = 'Tweet は正常に更新されました'
      redirect_to @tweet
    else
      flash[:danger] = 'Tweet は更新されませんでした'
      render :edit
    end
  end
    
  def destroy
    @tweet.destroy
    
    flash[:success] = 'Tweet は正常に削除されました'
    redirect_to tweets_url
  end
  
  private
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def tweet_params
    params.require(:tweet).permit(:content, :date)
  end
end
