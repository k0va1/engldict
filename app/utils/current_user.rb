module Utils
  class CurrentUser
    def call(message)
      from = message.from
      uid = from.id

      ::Models::User.find_or_create_by(uid: uid) do |user|
        user.name = from.username || "#{from.first_name} #{from.last_name}"
      end
    end
  end
end
