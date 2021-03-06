class PersonalizationQuestionsController < ApplicationController
  before_action :set_personalization_question, only: [:show, :edit, :update, :destroy]



  def update_question

    if user_signed_in?

      if params[:question_id] && params[:answer_id]

        question = PersonalizationQuestion.find(params[:question_id])
       
        answer = PersonalizationQuestionAnswer.find(params[:answer_id])


        if question && answer

          user_question_answer = UserQuestionAnswer.create(:personalization_question_id => question.id, :personalization_question_answer_id => answer.id, :user_id => current_user.id)
          
          unless answer.next_question_id

            redirect_to_url = root_path

          end

          render json: { :result => "success", :redirect_to_url => redirect_to_url, content_type: 'text/json' }

        else

          render json: { :result => "failure", :message => "no question or answer", content_type: 'text/json' }
        
        end

      else

        render json: { :result => "failure", :message => "no question or answer param", content_type: 'text/json' }
        
      end

    else

      render json: { :result => "failure", :message => "user not signed in", content_type: 'text/json' }

    end

  end

  

  def update_question_offer_matrix

    c = 1

    j = params[:oqaw_weight].count

    i = 1

    params[:oqaw_weight].each do |oqaw_weight|

      weight = params[:oqaw_weight][i.to_s].to_i

      question_id = params[:oqaw_question_id][i.to_s].to_i

      answer_id = params[:oqaw_answer_id][i.to_s].to_i

      offer_id = params[:oqaw_offer_id][i.to_s].to_i


      question = PersonalizationQuestion.where(:id => question_id).last

      
      unless question

        XXYYZZ

      end

      answer = PersonalizationQuestionAnswer.where(:id => answer_id).last

      offer = Offer.where(:id => offer_id).last


      if question && answer && offer

        existing_oqaw = OfferQuestionAnswerWeight.where(:personalization_question_id => question.id, :personalization_question_answer_id => answer.id, :offer_id => offer.id).last

        if existing_oqaw

          existing_oqaw.update(:weight => weight)

        else

          OfferQuestionAnswerWeight.create(:personalization_question_id => question.id, :personalization_question_answer_id => answer.id, :offer_id => offer.id, :weight => weight)

        end


      end


      i = i + 1

    end

    redirect_to questions_offers_path 

  end



  # GET /personalization_questions
  # GET /personalization_questions.json
  def index
    @personalization_questions = PersonalizationQuestion.all
  end

  # GET /personalization_questions/1
  # GET /personalization_questions/1.json
  def show
  end

  # GET /personalization_questions/new
  def new
    @personalization_question = PersonalizationQuestion.new
  end

  # GET /personalization_questions/1/edit
  def edit
  end

  # POST /personalization_questions
  # POST /personalization_questions.json
  def create
    @personalization_question = PersonalizationQuestion.new(personalization_question_params)

    respond_to do |format|
      
      if @personalization_question.save


        #something with answers



        #end something with answers


        format.html { redirect_to @personalization_question, notice: 'Personalization question was successfully created.' }
        format.json { render :show, status: :created, location: @personalization_question }
    
      else
    
        format.html { render :new }
        format.json { render json: @personalization_question.errors, status: :unprocessable_entity }
    
      end
    
    end

  end

  # PATCH/PUT /personalization_questions/1
  # PATCH/PUT /personalization_questions/1.json
  def update
    respond_to do |format|
      if @personalization_question.update(personalization_question_params)
        format.html { redirect_to @personalization_question, notice: 'Personalization question was successfully updated.' }
        format.json { render :show, status: :ok, location: @personalization_question }
      else
        format.html { render :edit }
        format.json { render json: @personalization_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personalization_questions/1
  # DELETE /personalization_questions/1.json
  def destroy
    @personalization_question.destroy
    respond_to do |format|
      format.html { redirect_to personalization_questions_url, notice: 'Personalization question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personalization_question
      @personalization_question = PersonalizationQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personalization_question_params
      params.require(:personalization_question).permit(:question, :additional_text, :display_id, :initial_question, :active, personalization_question_answers_attributes:[:id, :answer_text, :next_question_id])
    end
end
