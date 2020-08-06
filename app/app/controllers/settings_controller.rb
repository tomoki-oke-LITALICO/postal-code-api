class SettingsController < ApplicationController
  iam_policy "lambda"
  def update
    UpdateJob.perform_later(:import)
    render status: :accepted, json: { message: '202 Accepted.' }
  end
end
