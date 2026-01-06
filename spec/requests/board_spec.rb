require 'rails_helper'

describe 'Board', type: :request do
  let!(:user) { create(:user) }
  let!(:board) { create(:board) }
  before {
    session = defined?(rspec_session) ? rspec_session : {}
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: user.id })
  }

  it '他人の掲示板の編集画面に遷移できないこと' do
    expect { get edit_board_path(board) }.to raise_error ActiveRecord::RecordNotFound
  end

  it '他人の掲示板を更新できないこと' do
    expect { patch board_path(board) }.to raise_error ActiveRecord::RecordNotFound
  end

  it '他人の掲示板を削除できないこと' do
    expect { delete board_path(board) }.to raise_error ActiveRecord::RecordNotFound
  end
end
