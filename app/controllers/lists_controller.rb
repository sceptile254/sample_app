class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する
    @list = List.new
  end

  # 以下を追加
  def create
    # 1.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)
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

# ストロングパラメータ
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
