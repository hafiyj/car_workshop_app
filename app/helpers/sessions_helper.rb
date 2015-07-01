module SessionsHelper

  def log_in(workshop)
    session[:workshop_id] = workshop.id
  end

  def remember(workshop)
    workshop.remember
    cookies.permanent.signed[:workshop_id] = workshop.id
    cookies.permanent[:remember_token] = workshop.remember_token
  end

  def current_workshop
    if (workshop_id = session[:workshop_id])
      @current_workshop ||= Workshop.find_by(id: workshop_id)
    elsif (workshop_id = cookies.signed[:workshop_id])
      workshop = Workshop.find_by(id: workshop_id)
      if workshop && workshop.authenticated?(cookies[:remember_token])
        log_in workshop
        @current_workshop = workshop
      end
    end
  end

  def logged_in?
    !current_workshop.nil?
  end

  def log_out
    forget(current_workshop)
    session.delete(:workshop_id)
    @current_workshop = nil
  end

  def forget(workshop)
    workshop.forget
    cookies.delete(:workshop_id)
    cookies.delete(:remember_token)
  end

end
