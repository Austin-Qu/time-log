class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.page(params[:page]).per(10)
    authorize @audit_logs
  end

  def confirm
    @audit_log = AuditLog.find_by_id(params[:id])
    authorize @audit_log
    @audit_log.confirmed!
    redirect_to(root_path, notice:'Your audit log has been confirmed.')
  end
end
