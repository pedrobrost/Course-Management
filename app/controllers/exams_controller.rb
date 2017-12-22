class ExamsController < ApplicationController
  before_action :set_exams
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :change_results]

  # GET courses/1/exams/1
  def show
    @exam.course.students.each do |std|
      @exam.results.find_or_initialize_by(student: std)
    end
  end

  # GET courses/1/exams/new
  def new
    @exam = @course.exams.build
  end

  # GET courses/1/exams/1/edit
  def edit
  end

  # POST courses/1/exams
  def create
    @exam = @course.exams.build(exam_params)

    if @exam.save
      redirect_to([@exam.course, @exam], notice: 'El examen fue creado exitosamente.')
    else
      render action: 'new'
    end
  end

  # PUT courses/1/exams/1
  def update
    if @exam.update_attributes(exam_params)
      redirect_to([@exam.course, @exam], notice: 'El examen fue actualizado exitosamente.')
    else
      render action: 'edit'
    end
  end

  # DELETE courses/1/exams/1
  def destroy
    @exam.destroy
    if @exam.errors.empty?
      redirect_to(course_url(@exam.course), notice: 'El examen fue eliminado exitosamente.')
    else
      redirect_to(course_exam_url, alert: 'No se pudo borrar el examen')
    end
  end

  def change_results
    if @exam.update(results_params)
      redirect_to(course_exam_url(@exam.course, @exam), notice: 'Las notas se actualizaron exitosamente.')
    else
      render action: 'show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exams
      @course = Course.find(params[:course_id])
    end

    def set_exam
      @exam = @course.exams.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exam_params
      params.require(:exam).permit(:title, :date, :minimum)
    end

    def results_params
      params.require(:exam).permit(results_attributes: [:id, :score, :student_id])
    end
end
