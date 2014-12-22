class QuestionsController < ApplicationController
  # GET /questions
  def index
    @questions = Question.order("created_at DESC")
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    @answer = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to @question
    else
      render action: 'new'
    end
  end

  # GET /questions/search
  def search
    @questions = Question.search(params[:query])
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # PATCH /questons/1/update
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      @question.edit
    end
  end

  # DELETE /questions/id/delete
  def destroy
    Question.destroy(params[:id])
    redirect_to :action => "index"
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
