class CurriculumsController < ApplicationController
  before_action :set_curriculum

  def index
    curriculums = Curriculum.all.select(:id, :name, :description)
    render json: curriculums
  end

  def show
    redirect_to curriculum_learning_units_path(@curriculum)
  end

  def set_curriculum
    @curriculum = if params[:id].present?
                    Curriculum.find(params[:id])
                  else
                    Curriculum.first
                  end
  end
end
