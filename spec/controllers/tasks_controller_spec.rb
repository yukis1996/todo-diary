require 'rails_helper'

describe TasksController do
  let(:user) { create(:user) }
  let(:task) {{user_id: user.id, task: attributes_for(:task)}}

  # 1. indexアクションのテスト
  describe "GET index" do

    before do
      user = FactoryBot.create(:user)
      login user
    end

    # it 'populates an array of languages ordered by created_at' do
    #   tasks = create_list(:task, 3, user_id: user.id) 
    #   get :index
    #   expect(assigns(:task)).to match(tasks.sort{ |a, b| b.beforetime_id <=> a.beforetime_id } )
    # end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  # 2. newアクションがログインしていないと行えないかのテスト
  describe 'GET #new' do

    context 'log in' do

      before do
        login user
      end

      # newアクションを行なった時に正しくページに推移するかのテスト
      context 'can new action' do
        it 'renders the :new template'do
          get :new
          expect(response).to render_template :new
        end
      end

    end
  end

  # 3. createアクションがログインしていないと行えないかのテスト
  describe 'POST #create' do

    context 'log in' do
      before do
        login user
      end

      # 保存ができた場合の処理
      context 'can create task' do
        it 'count up task' do
          expect{post :create, params: task}.to change(Task, :count).by(1)
        end
        subject{get :new}
        it{ expect(subject).to render_template :new }
      end

      # 保存できなかった場合の処理
      context 'can not create task' do
        let(:invalid_task){{user_id: user, task: attributes_for(:task, day: nil, beforetime_id: nil, aftertime_id: nil, study_id: nil, place: nil, doing: nil, memo: nil)}}
        it 'count not up task' do
          expect{post :create, params: invalid_task}.to change(Task, :count).by(0)
        end
        subject{get :new}
        it{ expect(subject).to render_template :new }
      end

    end
  end

  
end
