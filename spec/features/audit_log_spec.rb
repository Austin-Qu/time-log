require 'rails_helper'

describe 'AuditLog features' do
  let(:audit_log) { FactoryGirl.create(:audit_log) }

  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'index' do
    it 'renders all audit_logs' do
      audit_log
      visit audit_logs_path
      expect(page).to have_content(/SDF/)
    end

    it 'cannot be visited by a non-admin user' do
      audit_log
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit audit_logs_path
      
      expect(current_path).to eq(root_path)
    end
  end
end
