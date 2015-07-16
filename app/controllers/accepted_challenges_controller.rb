class AcceptedChallengesController < ApplicationController
  def show
    @accepted_challenge = AcceptedChallenge.find(params[:id])
    binding.pry
    @challenge = @accepted_challenge.challenge
    @accepted_challenge.proofs.build if @accepted_challenge.proofs.length < 3

  end
  def create
    binding.pry
    @accepted_challenge = AcceptedChallenge.new
    @accepted_challenge.user_id = params[:user_id]
    @accepted_challenge.challenge_id = params[:challenge_id]
    @accepted_challenge.save
    render json: {message: "Good Job"}
  end

  def index
    @challenge = Challenge.find(params[:challenge_id])

    @accomplished_challenges = @challenge.accepted_challenges.where('is_accomplished = true')
  end

  def update
    @accepted_challenge = AcceptedChallenge.find(params[:id])
    binding.pry
    @accepted_challenge.is_accomplished = true;
    if @accepted_challenge.update(accepted_challenge_params)
      redirect_to @accepted_challenge
    else
      redirect_to @accepted_challenge
    end
  end


  def destroy
    @accepted_challenge = AcceptedChallenge.find(params[:id])
    @accepted_challenge.destroy
    redirect_to '/challenges'
  end

  def accepted_challenge_params
    params.require(:accepted_challenge).permit(:remark, proofs_attributes: [:proof_url, :id, :_destroy])
  end
end
