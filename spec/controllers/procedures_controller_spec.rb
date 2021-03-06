require 'rails_helper'
RSpec.describe ProceduresController, type: :controller do
  setup :activate_authlogic
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
    end
    context 'connected' do
      context 'have the right' do
      end
      context "don't have the right" do
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
    end
    context 'connected' do
      context 'have the right' do
      end
      context "don't have the right" do
      end
    end
  end
end
