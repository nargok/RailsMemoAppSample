class Api::MemosController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    memo = Memo.new(create_params)

    unless memo.save
      # エラーメッセージが入るインスタンス変数を定義
      @error_message = [memo.errors_full_messages].compact
    end

  end

  private

  def create_params
    params.permit(:text)
  end

end
