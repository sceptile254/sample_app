class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する
    @list = List.new
  end

  # 以下を追加
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
    # listsテーブル内の全データを取得し、@lists（インスタンス変数）に代入
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データを削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end

# ストロングパラメータ
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
