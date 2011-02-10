class RegistrationsController < Devise::RegistrationsController
  before_filter :check_registration_state, :except => [:edit, :update, :destroy]
end
