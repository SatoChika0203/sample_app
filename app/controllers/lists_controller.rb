class ListsController < ApplicationController
  def new  #投稿フォームのあるページを表示するアクション
    @list=List.new
  end
  
  def create  #投稿を保存するためのアクション、テーブルに値を格納する
    @list=List.new(list_params)   #データを受け取り新規登録するためのインスタンス作成
    if @list.save                    #データをデータベースに保存するためのsaveメソッド実行
    flash[:notice] = "投稿が成功しました"  # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
     redirect_to list_path(@list.id)   #show.html.erbへリダイレクトさせて、投稿内容がすぐに閲覧できるようにする
    else
                  #index.htmlで使用している@listsを、createアクション内で定義する
     render :new  #render :アクション名。同じコントローラ内の別アクションのViewを表示できる
    end
  end

  def index
    @lists=List.all   #allはメソッドの一種、そのモデルがやりとりしているデータベースのテーブルに保存されている、全てのレコードをまとめて取得。
  end

  def show
    @list=List.find(params[:id])  #findメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得してくる
    # params...フォームなどによって送られてきた情報を取得するメソッド
  end

  def edit
    @list=List.find(params[:id])
  end
  
  def update
    list=List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list=List.find(params[:id])
    list.destroy           # データ（レコード）を削除
    redirect_to '/lists'   # 投稿一覧画面へリダイレクト  
  
  end
  
  private #ストロングパラメータ「ここから下はこのcontrollerの中でしか呼び出せません」
  def list_params
    params.require(:list).permit(:title,:body,:image)
    
  end
  
  #1.params
  #formから送られてくるデータはparamsの中に入っています。（変数）
  #送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。（メソッド）
  #3.permit
  #requireで絞り込んだデータの中から、保存を許可するカラムを指定します。（メソッド）
  
end
