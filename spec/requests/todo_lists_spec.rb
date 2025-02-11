# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoList, type: :request do
  subject(:request) { get url_for(todo_list), params: params }

  let!(:todo_list) { described_class.create(name: "Test List 1") }

  describe '#show' do
    context 'when not given filter params' do
      let(:params) { }
      before { request }

      it 'returns OK' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when given filter params' do
      let(:params) { { filter: 'pending' } }
      let!(:todo_items) { TodoItem.create(name: "Test Item 1", status: :pending, todo_list: todo_list) }

      before { request }

      it 'returns correct todo items' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
