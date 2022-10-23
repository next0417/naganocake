class Public::ApplicationController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]
  layout 'public/application'
end