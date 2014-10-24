require "#{Rails.root}/app/helpers/application_helper"
require 'date'
include ApplicationHelper

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "Admin",
                         last_name: "User",
                         email: "admin@admin.org",
                         password: "dinero#2",
                         password_confirmation: "dinero#2",
                         admin: true)
  end
end