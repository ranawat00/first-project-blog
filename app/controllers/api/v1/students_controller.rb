class Api::V1::StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index 
    @students = Student.all 
    render json: @students, each_serializer: V1::StudentSerializer, status: :ok
  end

  def show
    @student = Student.find(params[:id])
    if @student 
      render json: @student
    else
      render json: { 'error' => 'Student not found'}, status: :not_found
    end
  end

  def create 
    @student= Student.new(student_params)

    if @student.save
      render json: @student, serializer: V1::StudentcreateSerializer, status: :ok
    else
      render json: {'message': 'Invalid'}, status: :unprocessable_entity
    end
  end


  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      render json: @student,status: :ok
    else
      render json: {'message': 'Invalid'},status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      render json: {message: "Student has been deleted successfully."}
    else 
      render json: {'message': 'Invalid'},status: :unprocessable_entity
    end
  end

  private
  def student_params
    params.require(:student).permit(:Name, :Login, :status)
  end
end