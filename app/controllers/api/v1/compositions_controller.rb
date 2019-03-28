class Api::V1::CompositionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @composition = Composition.create(composition_params)

    render json: { composition: CompositionSerializer.new(@composition) },
           status: :created
  end

  private

  def composition_params
    params.require(:composition).permit(:title, :artist, :user_id)
  end
end
