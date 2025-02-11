# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe 'validations' do
    subject(:todo_list) { described_class.new }

    it 'is not valid without a name' do
      expect(subject).not_to be_valid
      expect(subject.errors).to include(:name)
    end

    it 'is not valid without a todo_list' do
      expect(subject).not_to be_valid
      expect(subject.errors).to include(:todo_list)
    end
  end
end
