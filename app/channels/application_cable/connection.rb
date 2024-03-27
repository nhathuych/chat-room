# copied from https://guides.rubyonrails.org/action_cable_overview.html

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user # using like helpers in all of action cable files

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: cookies[:user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
