class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy check_answer reset_quiz_questions]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show

  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_answer
  # debugger
  # @prompts.first.
  #  Prompt.last(1).first.destroy
  # debugger
    @prompts = @prompts.drop(1)
    session['prompt_ids'] = @prompts.map{|prompt| prompt.id}
    # debugger
    respond_to do |format|
      format.html { redirect_to quiz_url(@quiz)}
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quiz_url(@quiz), notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def reset_quiz_questions
    session['prompt_ids'] = nil
    @prompts = Prompt.last(2)
    respond_to do |format|
      format.html { redirect_to quiz_url(@quiz), notice: "Quiz questions were successfully reset." }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      # session['prompt_ids'] = nil
      @quiz = Quiz.find(params[:id])
      # debugger 
      if session['prompt_ids'].present? && session['prompt_ids'].count > 0
        @prompts = Prompt.find(session['prompt_ids'])
      elsif session['prompt_ids']&.empty?
        @prompts = []
      else
        @prompts = @prompts ||= Prompt.last(2)
      end
      # debugger
      #NExt up, try making it do something if it only has one left. 
      # if !session['prompt_ids'].empty?
      # end
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:name)
    end
end
