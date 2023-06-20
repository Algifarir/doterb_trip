class MenuController < ApplicationController
  # before_action :set_attendance, only: []

  def index
  end

  def event
    @q = Event.order(:id).ransack(params[:q])
    @events = @q.result(distinct: true).page(params[:page]).per(5)

  end

  def user
    @q = User.order(id: :asc).ransack(params[:q])
    #@q = User.ransack(params[:q])
    @user = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def role
    @q = Role.order(id: :asc).ransack(params[:q])
    @role = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def attendance
    @q =  Attendance.includes(:user, :event).where(event_id:params[:id]).ransack(params[:q])
    @attendance = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def create_attendance
    att = Attendance.new(user_id:params[:user_id], event_id:params[:event_id], status:'Hadir')
    att.save
    redirect_to menu_event_path
  end

  def create_absent
    att = Attendance.new(user_id:params[:user_id], event_id:params[:event_id], status:'Absen')
    att.save
    redirect_to menu_event_path
  end

  def invite 
    @q = User.where.not(id: Attendance.where(event_id: params[:event_id]).pluck(:user_id)).ransack(params[:q])
    @users = @q.result.page(params[:page]).per(5)
  end

  def send_invitation
    user = User.find(params[:user_id])
    # InvitationMailer.send_invitation(user).deliver_now
  end
end
