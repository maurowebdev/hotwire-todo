# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoItem, type: :request do
  describe '#create' do
    subject(:request) { post todo_list_todo_items_path(todo_list), params: params }

    let!(:todo_list) { TodoList.create(name: 'Test List 1') }

    context 'when given proper params' do
      let(:params) { { todo_item: { name: 'Test Item 1', status: :pending } } }

      it 'creates the todo item' do
        expect{ request }.to change{TodoItem.count}.by(1)
      end
    end

    context 'when given wrong params' do
      let(:params) { { todo_item: { name: nil } } }

      it 'does NOT create the todo item' do
        expect{ request }.to_not change{TodoItem.count}
      end
    end
  end
end
