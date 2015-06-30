module SessionsHelper

  def log_in(workshop)
    session[:workshop_id] = workshop.id
  end

  def current_workshop
    @current_workshop ||= Workshop.find_by(id: session[:workshop_id])
  end

  def logged_in?
    !current_workshop.nil?
  end

  def log_out
    session.delete(:workshop_id)
    @current_workshop = nil
  end
end
