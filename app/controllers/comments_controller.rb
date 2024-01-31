class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @student = Student.find(params[:student_id])
    @comment = @student.comments.create(comment_params)
    redirect_to student_path(@student)
  end

  def destroy
    @student = Student.find(params[:student_id])
    @comment = @student.comments.find(params[:id])
    @comment.destroy
    redirect_to student_path(@student), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
