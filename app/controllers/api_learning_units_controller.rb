class ApiLearningUnitsController < ApiApplicationController
  def index
    learning_units = Curriculum
                     .find(params[:curriculum_id])
                     .learning_units
                     .includes(:completed_learning_units)
    checkpoints = []

    learning_units.each do |checkpoint|
      json_hash ={
        learning_unit_id: checkpoint.id,
        name: checkpoint.name,
        description: checkpoint.description,
        completed:  checkpoint.completed_learning_units.exists?
      }
      checkpoints << json_hash
    end
    render json: checkpoints
  end


  def show
    learning_unit = Curriculum
                    .find(params[:curriculum_id])
    render json: learning_unit, only: %i[id name description]
  end

  def create_completed_learning_unit
    completed_learning_unit = CompletedLearningUnit.create!(
      user_id: params[:user_id],
      learning_unit_id: params[:learning_unit_id]
    )

    render json: completed_learning_unit, status: :created
  end

  # def index_completed_learning_units
  #   completed_learning_units = Curriculum
  #                              .find(params[:curriculum_id])
  #                              .learning_units
  #                              .find(params[:learning_unit_id])
  #                              .completed_learning_units
  #   render json: completed_learning_units
  # end
end
